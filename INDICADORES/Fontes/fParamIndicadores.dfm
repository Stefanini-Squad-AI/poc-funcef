inherited frmParamIndicadores: TfrmParamIndicadores
  Left = 284
  Top = 117
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 245
  ClientWidth = 455
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 56
    Top = 176
    Width = 88
    Height = 13
    Caption = 'Aluguel Mínimo'
  end
  object Label7: TLabel [1]
    Left = 48
    Top = 168
    Width = 93
    Height = 13
    Caption = 'Meses Vencidos'
  end
  inherited pnlFundo: TPanel
    Width = 455
    Height = 159
    object Label3: TLabel
      Left = 28
      Top = 19
      Width = 26
      Height = 13
      Caption = 'UPV'
    end
    object Label1: TLabel
      Left = 28
      Top = 67
      Width = 97
      Height = 13
      Caption = 'Grupo de Regras'
    end
    object dblcUpv: TwwDBLookupCombo
      Left = 28
      Top = 35
      Width = 213
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOESIGLA'#9'10'#9'Sigla'#9'F'
        'MOEDESC'#9'20'#9'Descrição'#9'F')
      DataField = 'MOECODIGOUPV'
      DataSource = ds
      LookupTable = cdsMoeda
      LookupField = 'MOECODIGO'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dblcGrpRegra: TwwDBLookupCombo
      Left = 28
      Top = 83
      Width = 405
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição'#9'F')
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      LookupTable = cdsGrpRegra
      LookupField = 'IDGRUPOREGRA'
      DropDownWidth = 405
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbCkbLogotipo: TDBCheckBox
      Left = 28
      Top = 122
      Width = 208
      Height = 17
      Caption = 'Imprimir Logotipo nos Relatórios'
      DataField = 'FLGLOGORELAT'
      DataSource = ds
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 455
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Atualizar'
        Enabled = False
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        Images = nil
        NumGlyphs = 3
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 206
    Width = 455
    inherited tb97Fundo: TToolbar97
      Left = 283
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 114
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 34
  end
  inherited ImlPadrao: TImageList
    Left = 24
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
  end
  inherited Cds: TCMClientDataSet
    object CdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsMOECODIGOUPV: TFloatField
      FieldName = 'MOECODIGOUPV'
    end
    object CdsIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
    end
    object CdsFLGLOGORELAT: TStringField
      FieldName = 'FLGLOGORELAT'
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Left = 376
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 392
    Top = 55
    object cdsMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object cdsMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
    end
    object cdsMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object cdsMoedaFLGPERCVALOR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERCVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsGrpRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 55
    object cdsGrpRegraDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsGrpRegraIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
      Visible = False
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM PARAMINDICADORES')
    Left = 264
    Top = 55
  end
end
