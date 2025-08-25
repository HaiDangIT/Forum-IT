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
  username: joi.string().alphanum().min(3).max(30).required().messages({
    "string.alphanum": "Tên người dùng chỉ được chứa chữ cái và số",
    "string.min": "Tên người dùng phải có ít nhất 3 ký tự",
    "string.max": "Tên người dùng không được vượt quá 30 ký tự",
    "string.empty": "Tên người dùng là bắt buộc",
  }),
  firstName: joi.string().min(2).max(50).required().messages({
    "string.min": "Tên phải có ít nhất 2 ký tự",
    "string.max": "Tên không được vượt quá 50 ký tự",
    "string.empty": "Tên là bắt buộc",
  }),
  lastName: joi.string().min(2).max(50).required().messages({
    "string.min": "Họ phải có ít nhất 2 ký tự",
    "string.max": "Họ không được vượt quá 50 ký tự",
    "string.empty": "Họ là bắt buộc",
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
