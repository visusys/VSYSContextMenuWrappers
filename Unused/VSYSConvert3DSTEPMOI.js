
function Convert( FileName )
{
    var gd = moi.geometryDatabase;

    // Open the file, set 2nd param to true to suppress any save changes prompt.
    gd.open( FileName, true );

    // Create the output file name by breaking off the file extension and adding 'obj'.
    
    FBXFileName = FileName.substr( 0, FileName.lastIndexOf('.') + 1 ) + 'fbx';

    // Save out to the output file, passing the option to suppress the UI. You
    // add other options separated by semi-colons with no spaces. These
    // options are available for controlling the meshing:
    // NoUI=true
    // Angle=12.0
    // Output=ngons | quads | triangles
    // MaxLength=0.0
    // MaxLengthApplyTo=curved | planes | all
    // MinLength=0.0
    // AspectRatio=0.0
    // Weld=true
    // Display=shadedwithedges | shadednoedges | wireframe
    // ExpandedDialog=false

    // gd.saveAs( OBJFileName, 'NoUI=true' );
    gd.saveAs( FBXFileName, 'NoUI=true' );

    // Let's clear out and suppress any save changes prompt again.
    gd.fileNew( true );
}

// Convert( 'c:\\scripts\\test\\test1.igs' );
// Convert( 'c:\\scripts\\test\\test2.igs' );
// Convert( 'c:\\scripts\\test\\test3.igs' );

// moi.exit( true ); // Pass true to suppress save changes prompt.