import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testng.keyword.TestNGBuiltinKeywords as TestNGKW
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.openBrowser('')

WebUI.navigateToUrl('http://localhost:8080/login')

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), '.')

WebUI.sendKeys(findTestObject('Object Repository/Page_Login/input_Email_username'), Keys.chord(Keys.ENTER))

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), '.adminmottu')

WebUI.setEncryptedText(findTestObject('Object Repository/Page_Login/input_Senha_password'), 'Lq+8uQmq4UuGHDg/so9+wg==')

WebUI.click(findTestObject('Object Repository/Page_Login/button_submit'))

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), '')

WebUI.setEncryptedText(findTestObject('Object Repository/Page_Login/input_Senha_password'), 'YhyMIxsVqyR5qfAXFP5xcQ==')

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), 'admin@email.com')

WebUI.click(findTestObject('Object Repository/Page_Login/button_submit'))

WebUI.click(findTestObject('Object Repository/Page_Menu/a'))

WebUI.click(findTestObject('Object Repository/New Folder/Page_Gerenciar Localidades/a_OPERACIONAL_button edit'))

WebUI.click(findTestObject('Object Repository/Page_Editar Localidade/a_Salvar Alteraes_button cancel'))

WebUI.openBrowser('')

WebUI.navigateToUrl('http://localhost:8080/login')

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), 'admin@email.com')

WebUI.setEncryptedText(findTestObject('Object Repository/Page_Login/input_Senha_password'), 'Lq+8uQmq4UuGHDg/so9+wg==')

WebUI.click(findTestObject('Object Repository/Page_Login/button_submit'))

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), 'admin@email.com')

WebUI.setEncryptedText(findTestObject('Object Repository/Page_Login/input_Senha_password'), 'YhyMIxsVqyR5qfAXFP5xcQ==')

WebUI.click(findTestObject('Object Repository/Page_Login/button_submit'))

WebUI.click(findTestObject('Object Repository/Page_Menu/a_1'))

WebUI.click(findTestObject('Object Repository/Page_Menu/a'))

WebUI.openBrowser('')

WebUI.closeBrowser()

WebUI.openBrowser('')

WebUI.navigateToUrl('http://localhost:8080/login')

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), 'http://localhost:8080/login')

WebUI.setEncryptedText(findTestObject('Object Repository/Page_Login/input_Senha_password'), 'YhyMIxsVqyR5qfAXFP5xcQ==')

WebUI.setText(findTestObject('Object Repository/Page_Login/input_Email_username'), 'admin@email.com')

WebUI.click(findTestObject('Object Repository/Page_Login/button_submit'))

WebUI.click(findTestObject('Object Repository/Page_Menu/a'))

WebUI.closeBrowser()

