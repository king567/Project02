using BookStore.Site.Models.FEModels;
using BookStore.Site.Models.Infra;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Member = BookStore.Site.Models.FEModels.Member;

namespace BookStore.Site.Models.ViewModels
{
    public static class RegisterExts
    {
        public static Member ToEFModel(this RegisterVm vm) 
        {
            var salt = HashUtility.GetSalt();
            var hashPassword = HashUtility.ToSHA256(vm.Password, salt);
            var confirmCode=Guid.NewGuid().ToString("N");

            return new Member
            {
                Id = vm.Id,
                Account = vm.Account,
                EncryptedPassword = hashPassword,
                Email = vm.Email,
                Name = vm.Name,
                Mobile = vm.Mobile,
                IsConfirmed = false,
                ConfirmCode = confirmCode
            };
        }
    }
}