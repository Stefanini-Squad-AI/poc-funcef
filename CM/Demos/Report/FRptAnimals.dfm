inherited FrmCmReprot1: TFrmCmReprot1
  Left = 330
  Top = 201
  Caption = 'RptAnimal'
  PixelsPerInch = 120
  TextHeight = 16
  inherited QryRptCM: TwwQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'SELECT * FROM ANIMALS')
    object QryRptCMNAME: TStringField
      FieldName = 'NAME'
      Origin = 'DBDEMOS."ANIMALS.DBF".NAME'
      Size = 10
    end
    object QryRptCMSIZE: TSmallintField
      FieldName = 'SIZE'
      Origin = 'DBDEMOS."ANIMALS.DBF".SIZE'
    end
    object QryRptCMWEIGHT: TSmallintField
      FieldName = 'WEIGHT'
      Origin = 'DBDEMOS."ANIMALS.DBF".WEIGHT'
    end
    object QryRptCMAREA: TStringField
      FieldName = 'AREA'
      Origin = 'DBDEMOS."ANIMALS.DBF".AREA'
    end
    object QryRptCMBMP: TBlobField
      FieldName = 'BMP'
      Origin = 'DBDEMOS."ANIMALS.DBF".BMP'
      BlobType = ftTypedBinary
      Size = 1
    end
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros do Relatório Listagem de Animais'
    DataBaseName = 'DBDEMOS'
    Params = <
      item
        Caption = 'Nome'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
      end
      item
        Caption = 'Area'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT AREA FROM ANIMALS ORDER BY AREA')
        LookupSettings.Chave = 'AREA'
        LookupSettings.Display = 'AREA'
        LookupSettings.Descricao = 'AREA'
        LookupSettings.Tamanho = '40'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
      end>
  end
end
