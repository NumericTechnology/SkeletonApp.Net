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
 
using KPBO.Parameters;
using KPComponents;
using NHibernate.Validator.Cfg;
using SpecialistData;
using System;
using System.Diagnostics;
using System.Reflection;

namespace WebProject
{
    /// <summary>
    /// <para>Authors: Juliano Tiago Rinaldi and 
    /// Tiago Antonio Jacobi</para>
    /// </summary>
    public class Global : KPGlobal
    {
        protected override void ApplicationError(object sender, EventArgs e)
        {
        }

        protected override void ApplicationStart(object sender, EventArgs e)
        {
        }

        protected override void SessionEnd(object sender, EventArgs e)
        {
        }

        protected override void SessionStart(object sender, EventArgs e)
        {
        }
    }
}
