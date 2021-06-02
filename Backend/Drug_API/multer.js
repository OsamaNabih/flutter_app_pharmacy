const multer = require('multer');
const path = require('path');


//Set Storage Engine;
const storage = multer.diskStorage({
destination:'./Images',
filename: function(req, file, cb){
  cb(null, file.filename + '-' + Date.now() + path.extname(file.originalname));
}
});


//Init Upload
const upload = multer({
  storage:storage,
  limits:{fileSize: 20000000},
  fileFilter:function(req,file,cb){
    checkFileType(file,cb);
  }
}).any();

module.exports = {

  uploadPhoto: (req, res, next) => {
    upload(req, res, (err) => {
      if(err){
        req.error = err;
        console.log(err);
        next(err);
      }
      else{
        console.log("photo is trying to upload itself");
        if(req.files[0] == undefined)
        {
          next(req.error);
          console.log("No Photo Selected");
          next();
        }
        else {
          next();
        }
          
      }
    });
  },

  photoUploaded: (req, res, next) => {
    //photo photouploaded
    if(req.error)
    {
      console.log("error in photoUploaded");
      res.status(404);
    }
    if(req.files[0] == undefined)
      {
        console.log("No Photo Seleced");
        return next();
      }
    console.log("No error in photo uploading");
    return next();
  },

}
function checkFileType(file,cb){
  // allowed extension
  const filetypes= /jpeg|jpg|png|gif/;
  //check extestion
  const extname = filetypes.test(path.extname(file.originalname).toLowerCase());
  // Check mime
  const mimetype = filetypes.test(file.mimetype);
  if(mimetype && extname){
    return cb(null,true);
  }
  else
  {
    cb('Error:Images only!');
  }
}

