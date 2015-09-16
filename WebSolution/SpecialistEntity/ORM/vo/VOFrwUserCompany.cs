/*
 * Copyright 2011-2015 Numeric Technology
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
using NHibernate.Validator.Constraints;
using System;

namespace SpecialistEntity.ORM.VO
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    [Serializable]
    public class VoFrwUserCompany
    {
        [NotNull]
        #region
        public virtual int  IdUser { get; set; }
        #endregion IdUser

        #region IS_DEFAULT_COMPANY
        public virtual bool IsDefaultCompany { get; set; }
        #endregion IsDefaultCompany

        #region ID_COMPANY
        [NotNull]
        public virtual int IdCompany { get; set; }
        #endregion IdCompany

        #region ID_USER_COMPANY
        [NotNull]
        public virtual int IdUserCompany { get; set; }
        #endregion IdUserCompany

        [Length(Max = 255)]
        [NotNull]
        public virtual string CompanyName { get; set; }

        [Length(Max = 255)]
        [NotEmpty]
        [NotNull]
        public virtual string UserFullName { get; set; }

    }
}
