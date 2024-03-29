/* Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
  /**
 *
 * 
 * @author <a href='mailto:limcheekin@vobject.com'>Lim Chee Kin</a>
 *
 * @since 0.1
 */
 
 updateConfig()
 
 private void updateConfig() {
	def configFile = new File(basedir, 'grails-app/conf/Config.groovy')
	if (configFile.exists() && configFile.text.indexOf("formBuilder") == -1) {
		configFile.withWriterAppend {
			it.writeLine '\n// Added by the Form Builder plugin:'
			it.writeLine '''\
formBuilder {
	reloadUpdatedDomainClassesInMs = 60000
	SingleLineText {
		type = 'String'
		defaultConstraints = [maxSize: 255]
	}
}
'''
		}
		ant.echo '''
************************************************************
* Your grails-app/conf/Config.groovy has been updated with *
* default configurations of Form Builder plugin;           *
* please verify that the values are correct.               *
************************************************************
		'''
	}
}