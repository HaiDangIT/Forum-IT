export function successResponse(data: any, message = 'Thành công') {
  return {
    success: true,
    data,
    message,
  };
}

export function errorResponse(message = 'Đã xảy ra lỗi', code = 400) {
  return {
    success: false,
    error: {
      code,
      message,
    },
  };
}