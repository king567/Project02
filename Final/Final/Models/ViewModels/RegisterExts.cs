using Final.Models.EFModels;
using Final.Models.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Final.Models.ViewModels
{
    public static class RegisterExts
    {
        public static User ToEFModel(this RegisterVm vm)
        {
            var salt = HashUtility.GetSalt();
            var hashPassword = HashUtility.ToSHA256(vm.Password, salt);
            var confirmCode = Guid.NewGuid().ToString("N");

            return new User
            {
                Id = vm.Id,
                Account = vm.Account,
                Password = hashPassword,
                Name = vm.Name,
                IsConfirmed = false,
                ConfirmCode = confirmCode
            };
        }
    }
}