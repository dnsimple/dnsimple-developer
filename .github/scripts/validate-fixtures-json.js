#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

/**
 * Extract JSON content from HTTP fixture files
 * @param {string} filePath - Path to the HTTP file
 * @returns {string|null} - JSON content or null if not found
 */
function extractJsonFromHttpFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  
  // Split by double newline to separate headers from body
  const parts = content.split(/\n\s*\n/, 2);
  
  if (parts.length < 2) {
    return null;
  }
  
  const body = parts[1].trim();
  if (!body) {
    return null;
  }
  
  // Check if content-type indicates JSON
  const headers = parts[0];
  const isJsonContentType = headers.includes('Content-Type: application/json') || 
                           headers.includes('content-type: application/json');
  
  // If no explicit JSON content-type, try to parse as JSON anyway
  // (some files might have JSON without proper content-type header)
  if (!isJsonContentType) {
    try {
      JSON.parse(body);
      return body;
    } catch (e) {
      return null;
    }
  }
  
  return body;
}

/**
 * Recursively find all .http files in a directory
 * @param {string} dir - Directory to search
 * @returns {string[]} - Array of file paths
 */
function findHttpFiles(dir) {
  const files = [];
  
  function traverse(currentDir) {
    const items = fs.readdirSync(currentDir);
    
    for (const item of items) {
      const fullPath = path.join(currentDir, item);
      const stat = fs.statSync(fullPath);
      
      if (stat.isDirectory()) {
        traverse(fullPath);
      } else if (item.endsWith('.http')) {
        files.push(fullPath);
      }
    }
  }
  
  traverse(dir);
  return files;
}

/**
 * Validate JSON in fixture files
 * @param {string} fixturesDir - Directory containing fixtures
 */
function validateJsonInFixtures(fixturesDir) {
  const errors = [];
  let filesChecked = 0;
  let jsonFilesFound = 0;
  
  console.log(`🔍 Scanning for HTTP fixtures in: ${fixturesDir}`);
  
  const httpFiles = findHttpFiles(fixturesDir);
  
  for (const filePath of httpFiles) {
    filesChecked++;
    const jsonContent = extractJsonFromHttpFile(filePath);
    
    if (!jsonContent) {
      continue;
    }
    
    jsonFilesFound++;
    
    try {
      JSON.parse(jsonContent);
      console.log(`✅ ${filePath}`);
    } catch (e) {
      const errorMsg = `❌ ${filePath}: Invalid JSON - ${e.message}`;
      console.log(errorMsg);
      errors.push(errorMsg);
    }
  }
  
  console.log('\n📊 Summary:');
  console.log(`Files checked: ${filesChecked}`);
  console.log(`JSON files found: ${jsonFilesFound}`);
  console.log(`Validation errors: ${errors.length}`);
  
  if (errors.length > 0) {
    console.log('\n❌ Errors found:');
    errors.forEach(error => console.log(`  ${error}`));
    process.exit(1);
  } else {
    console.log('\n🎉 All JSON fixtures are valid!');
    process.exit(0);
  }
}

// Main execution
const fixturesDir = process.argv[2] || 'fixtures/v2';

if (!fs.existsSync(fixturesDir)) {
  console.error(`❌ Error: Directory '${fixturesDir}' does not exist`);
  process.exit(1);
}

validateJsonInFixtures(fixturesDir);
