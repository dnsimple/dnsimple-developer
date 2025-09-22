const fs = require('fs');
const path = require('path');
const glob = require('glob');

// Function to extract JSON from .http file
function extractJsonFromHttpFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  
  // Split by double newline to separate headers from body
  const parts = content.split('\r\n\r\n');

  if (parts.length < 2) {
    return '{}';
  }
  
  // The JSON response should be after the headers
  // Join all parts after the first (in case JSON contains double newlines)
  const jsonContent = parts.slice(1).join('\r\n').trim();

  if (!jsonContent) {
    return '{}';
  }
  
  return jsonContent;
}

// Function to validate JSON
function validateJson(jsonString, filePath) {
  try {
    JSON.parse(jsonString);
    return { valid: true, error: null };
  } catch (error) {
    return { valid: false, error: error.message };
  }
}

// Main validation function
async function validateAllFixtures() {
  const pattern = 'fixtures/v2/api/**/*.http';
  const allFiles = glob.sync(pattern);
  
  if (allFiles.length === 0) {
    console.log('No .http files found in fixtures/v2/api/');
    return;
  }

  // Files to ignore (contain intentionally invalid JSON)
  const ignoreFiles = [
    'fixtures/v2/api/success-with-malformed-json.http',
    'fixtures/v2/api/badgateway.http'
  ];

  // Filter out ignored files
  const files = allFiles.filter(file => !ignoreFiles.includes(file));
  
  let totalFiles = 0;
  let validFiles = 0;
  let invalidFiles = [];
  
  for (const file of files) {
    totalFiles++;
    
    try {
      const jsonContent = extractJsonFromHttpFile(file);
      const validation = validateJson(jsonContent, file);

      if (validation.valid) {
        validFiles++;
        process.stdout.write('.');
      } else {
        invalidFiles.push({ file, error: validation.error });
        process.stdout.write('F');
      }
    } catch (error) {
      invalidFiles.push({ file, error: error.message });
      process.stdout.write('F');
    }
  }

  
  // Summary
  console.log('\n')
  console.log('VALIDATION SUMMARY');
  console.log('='.repeat(50));
  console.log(`Total files: ${totalFiles}`);
  console.log(`Valid files: ${validFiles}`);
  console.log(`Invalid files: ${invalidFiles.length}`);
  
  if (invalidFiles.length > 0) {
    console.log('\n❌ INVALID FILES:');
    invalidFiles.forEach(({ file, error }) => {
      console.log(`  ${file}: ${error}`);
    });
    
    process.exit(1);
  } else {
    console.log('\n✅ All JSON fixtures are valid!');
  }
}

// Run validation
validateAllFixtures().catch(error => {
  console.error('Validation failed:', error);
  process.exit(1);
});
