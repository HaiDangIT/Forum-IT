const joi = require("joi");

const schema = joi.object({
  email: joi.string().email().required().messages({
    "string.email": "Email không hợp lệ",
    "string.empty": "Email không được để trống",
  }),
  password: joi
    .string()
    .pattern(new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"))
    .required()
    .messages({
      "string.pattern.base":
        "Mật khẩu phải có ít nhất 6 ký tự, chứa ít nhất một chữ hoa, một chữ thường và một số",
      "string.empty": "Mật khẩu là bắt buộc",
    }),
});

module.exports = (req, res, next) => {
  const { error } = schema.validate(req.body, { abortEarly: false });
  if (error) {
    const errors = error.details.map((err) => err.message);
    return res.status(400).json({ errors });
  }
  next();
};
