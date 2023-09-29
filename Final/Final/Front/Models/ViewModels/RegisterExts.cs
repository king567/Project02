using Project2.Models.EFModels;
using Project2.Models.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project2.Models.ViewModels
{
    public static class RegisterExts
    {
        public static Member ToEFModel(this RegisterVm vm)
        {
            var salt = HashUtility.GetSalt();
            var hashPassword = HashUtility.ToSHA256(vm.Password, salt);
            var confirmCode = Guid.NewGuid().ToString("N");

            return new Member
            {
                Id = vm.Id,
                Account = vm.Account,
                Password = hashPassword,
                Email = vm.Email,
                Name = vm.Name,
                BirthOfDate = DateTime.Parse(vm.BirthOfDay),
                IsConfirmed = false,
                ConfirmedCode = confirmCode,
                CreatedTime=DateTime.Now,
            };
        }
    }
}