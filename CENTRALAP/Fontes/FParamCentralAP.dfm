inherited frmParamCentralAP: TfrmParamCentralAP
  Left = 87
  Top = 64
  HelpContext = 230005
  Caption = 'Tela de Parâmetros'
  ClientHeight = 448
  ClientWidth = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 620
    Height = 362
    object PageControl1: TPageControl
      Left = 46
      Top = 9
      Width = 535
      Height = 343
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = '&Gerais'
        object Label13: TLabel
          Left = 22
          Top = 17
          Width = 171
          Height = 13
          Caption = 'Forma de Atendimento Padrão'
        end
        object Label3: TLabel
          Left = 22
          Top = 63
          Width = 191
          Height = 13
          Caption = 'Documento de Identidade Padrão'
        end
        object dblkFormaAtend: TwwDBLookupCombo
          Left = 22
          Top = 31
          Width = 294
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Descrição'#9'F')
          DataField = 'IDTIPOATENDPADRAO'
          DataSource = ds
          LookupTable = qryFormaAtend
          LookupField = 'IDTIPOATEND'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object DBRGCtrlProtocolo: TDBRadioGroup
          Left = 22
          Top = 120
          Width = 294
          Height = 105
          Caption = 'Controle de Alteração e Exclusão de Protocolo'
          DataField = 'FLGCTRLPROTOCOLO'
          DataSource = ds
          Items.Strings = (
            '&Não Controla Protocolo'
            'Controla Protocolo por &Usuário'
            'Controla Protocolo por &Grupo de Usuários')
          TabOrder = 1
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object DblkTipoDocPessoa: TwwDBLookupCombo
          Left = 22
          Top = 77
          Width = 294
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO'#9'F')
          DataField = 'IDDOCRG'
          DataSource = ds
          LookupTable = qrytipodocpessoa
          LookupField = 'IDDOCUMENTO'
          Enabled = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object chkbxFlgMudaLocalAtend: TCheckBox
          Left = 22
          Top = 247
          Width = 339
          Height = 17
          Caption = 'Permitir Alteração do local de Atendimento no LOGON'
          TabOrder = 3
          OnClick = chkbxFlgMudaLocalAtendClick
        end
        object CkbDataHora: TCheckBox
          Left = 22
          Top = 268
          Width = 339
          Height = 17
          Caption = 'Confirma Data,  Hora e Tipo de Atendimento no LOGON'
          TabOrder = 4
          OnClick = CkbDataHoraClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = '&Protocolos Automáticos'
        ImageIndex = 1
        object Bevel3: TBevel
          Left = 5
          Top = 168
          Width = 244
          Height = 132
        end
        object Bevel2: TBevel
          Left = 278
          Top = 20
          Width = 244
          Height = 132
        end
        object Bevel1: TBevel
          Left = 5
          Top = 20
          Width = 244
          Height = 132
        end
        object Label1: TLabel
          Left = 12
          Top = 30
          Width = 49
          Height = 13
          Caption = 'Inclusão'
        end
        object Label2: TLabel
          Left = 21
          Top = 13
          Width = 55
          Height = 13
          Caption = 'Endereço'
        end
        object Label4: TLabel
          Left = 12
          Top = 67
          Width = 55
          Height = 13
          Caption = 'Alteração'
        end
        object Label5: TLabel
          Left = 11
          Top = 104
          Width = 52
          Height = 13
          Caption = 'Exclusão'
        end
        object Label6: TLabel
          Left = 294
          Top = 13
          Width = 51
          Height = 13
          Caption = 'Telefone'
        end
        object Label7: TLabel
          Left = 285
          Top = 30
          Width = 49
          Height = 13
          Caption = 'Inclusão'
        end
        object Label8: TLabel
          Left = 285
          Top = 67
          Width = 55
          Height = 13
          Caption = 'Alteração'
        end
        object Label9: TLabel
          Left = 284
          Top = 104
          Width = 52
          Height = 13
          Caption = 'Exclusão'
        end
        object Label10: TLabel
          Left = 21
          Top = 161
          Width = 86
          Height = 13
          Caption = 'Conta Corrente'
        end
        object Label11: TLabel
          Left = 12
          Top = 178
          Width = 49
          Height = 13
          Caption = 'Inclusão'
        end
        object Label12: TLabel
          Left = 12
          Top = 215
          Width = 55
          Height = 13
          Caption = 'Alteração'
        end
        object Label14: TLabel
          Left = 11
          Top = 252
          Width = 52
          Height = 13
          Caption = 'Exclusão'
        end
        object Bevel4: TBevel
          Left = 278
          Top = 168
          Width = 244
          Height = 132
        end
        object Label15: TLabel
          Left = 294
          Top = 161
          Width = 105
          Height = 13
          Caption = 'Geração de RUBS'
        end
        object dblkEndInc: TwwDBLookupCombo
          Left = 12
          Top = 44
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          AutoSelect = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
          OnChange = dblkEndIncChange
        end
        object dblkEndAlt: TwwDBLookupCombo
          Left = 12
          Top = 81
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkEndAltChange
        end
        object dblkEndExcl: TwwDBLookupCombo
          Left = 12
          Top = 118
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkEndExclChange
        end
        object dblktelInc: TwwDBLookupCombo
          Left = 285
          Top = 44
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblktelIncChange
        end
        object dblktelAlt: TwwDBLookupCombo
          Left = 285
          Top = 81
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblktelAltChange
        end
        object dblkTelExcl: TwwDBLookupCombo
          Left = 285
          Top = 118
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkTelExclChange
        end
        object dblkccInc: TwwDBLookupCombo
          Left = 12
          Top = 192
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkccIncChange
        end
        object dblkccAlt: TwwDBLookupCombo
          Left = 12
          Top = 229
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkccAltChange
        end
        object dblkccExcl: TwwDBLookupCombo
          Left = 12
          Top = 266
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 8
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkccExclChange
        end
        object dblkrubsgera: TwwDBLookupCombo
          Left = 285
          Top = 192
          Width = 230
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = QRYFIARIOASSUNTO
          LookupField = 'IDFIARASS'
          TabOrder = 9
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkrubsgeraChange
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Auto-Atendimento'
        ImageIndex = 2
        object Label16: TLabel
          Left = 32
          Top = 41
          Width = 135
          Height = 13
          Caption = 'Instância da Base WEB'
        end
        object Label17: TLabel
          Left = 32
          Top = 97
          Width = 170
          Height = 13
          Caption = 'Login de Acesso à Base WEB'
        end
        object Label18: TLabel
          Left = 32
          Top = 153
          Width = 175
          Height = 13
          Caption = 'Senha de Acesso à Base WEB'
        end
        object wwDBEdit1: TwwDBEdit
          Left = 30
          Top = 56
          Width = 264
          Height = 21
          DataField = 'WEBBASE'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit2: TwwDBEdit
          Left = 30
          Top = 112
          Width = 264
          Height = 21
          DataField = 'WEBLOGIN'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit3: TwwDBEdit
          Left = 30
          Top = 168
          Width = 264
          Height = 21
          DataField = 'WEBSENHA'
          DataSource = ds
          PasswordChar = '*'
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 620
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 620
    inherited tb97Fundo: TToolbar97
      Left = 375
      DockPos = 375
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select '
      '*'
      'from PARAMCENTRALAP')
    Left = 132
    Top = 307
    object qryIDCARTAPADRAO: TFloatField
      FieldName = 'IDCARTAPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
    end
    object qryIDETIQPADRAO: TFloatField
      FieldName = 'IDETIQPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDETIQPADRAO'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDPESSOA'
    end
    object qryIDTIPOATENDPADRAO: TFloatField
      FieldName = 'IDTIPOATENDPADRAO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDTIPOATENDPADRAO'
    end
    object qryIDDOCRG: TFloatField
      FieldName = 'IDDOCRG'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDDOCRG'
    end
    object qryFLGCTRLPROTOCOLO: TFloatField
      FieldName = 'FLGCTRLPROTOCOLO'
      Origin = 'BASEDADOS.PARAMCENTRALAP.FLGCTRLPROTOCOLO'
    end
    object qryIDFIARIOENDINC: TFloatField
      FieldName = 'IDFIARIOENDINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOENDINC'
    end
    object qryIDFIARIOTELEXC: TFloatField
      FieldName = 'IDFIARIOTELEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOTELEXC'
    end
    object qryIDFIARIOTELALT: TFloatField
      FieldName = 'IDFIARIOTELALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOTELALT'
    end
    object qryIDFIARIOTELINC: TFloatField
      FieldName = 'IDFIARIOTELINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOTELINC'
    end
    object qryIDFIARIOCCEXC: TFloatField
      FieldName = 'IDFIARIOCCEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOCCEXC'
    end
    object qryIDFIARIOCCALT: TFloatField
      FieldName = 'IDFIARIOCCALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOCCALT'
    end
    object qryIDFIARIOCCINC: TFloatField
      FieldName = 'IDFIARIOCCINC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOCCINC'
    end
    object qryIDFIARIOENDEXC: TFloatField
      FieldName = 'IDFIARIOENDEXC'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOENDEXC'
    end
    object qryIDFIARIOENDALT: TFloatField
      FieldName = 'IDFIARIOENDALT'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDFIARIOENDALT'
    end
    object qryIDPROTOCOLORUB: TFloatField
      FieldName = 'IDPROTOCOLORUB'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDPROTOCOLORUB'
    end
    object qryFLGMUDALOCALATEND: TFloatField
      FieldName = 'FLGMUDALOCALATEND'
      Origin = 'BASEDADOS.PARAMCENTRALAP.FLGMUDALOCALATEND'
    end
    object qryFLGCONFIRMADATA: TFloatField
      FieldName = 'FLGCONFIRMADATA'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
    end
    object qryWEBLOGIN: TStringField
      FieldName = 'WEBLOGIN'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
      Size = 100
    end
    object qryWEBSENHA: TStringField
      FieldName = 'WEBSENHA'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
      Size = 100
    end
    object qryWEBBASE: TStringField
      FieldName = 'WEBBASE'
      Origin = 'BASEDADOS.PARAMCENTRALAP.IDCARTAPADRAO'
      Size = 100
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 650
    Top = 65
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMCENTRALAP'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDCARTAPADRAO = :IDCARTAPADRAO,'
      '  IDETIQPADRAO = :IDETIQPADRAO,'
      '  IDTIPOATENDPADRAO = :IDTIPOATENDPADRAO,'
      '  IDDOCRG = :IDDOCRG,'
      '  FLGCTRLPROTOCOLO = :FLGCTRLPROTOCOLO,'
      '  IDFIARIOENDINC = :IDFIARIOENDINC,'
      '  IDFIARIOTELEXC = :IDFIARIOTELEXC,'
      '  IDFIARIOTELALT = :IDFIARIOTELALT,'
      '  IDFIARIOTELINC = :IDFIARIOTELINC,'
      '  IDFIARIOCCEXC = :IDFIARIOCCEXC,'
      '  IDFIARIOCCALT = :IDFIARIOCCALT,'
      '  IDFIARIOCCINC = :IDFIARIOCCINC,'
      '  IDFIARIOENDEXC = :IDFIARIOENDEXC,'
      '  IDFIARIOENDALT = :IDFIARIOENDALT,'
      '  IDPROTOCOLORUB = :IDPROTOCOLORUB,'
      '  FLGMUDALOCALATEND = :FLGMUDALOCALATEND,'
      '  FLGCONFIRMADATA = :FLGCONFIRMADATA,'
      '  WEBLOGIN = :WEBLOGIN,'
      '  WEBSENHA = :WEBSENHA,'
      '  WEBBASE = :WEBBASE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PARAMCENTRALAP'
      '  (IDPESSOA, IDCARTAPADRAO, IDETIQPADRAO, IDTIPOATENDPADRAO, '
      'IDDOCRG, FLGCTRLPROTOCOLO, '
      
        '   IDFIARIOENDINC, IDFIARIOTELEXC, IDFIARIOTELALT, IDFIARIOTELIN' +
        'C, '
      'IDFIARIOCCEXC, '
      
        '   IDFIARIOCCALT, IDFIARIOCCINC, IDFIARIOENDEXC, IDFIARIOENDALT,' +
        ' '
      'IDPROTOCOLORUB, '
      '   FLGMUDALOCALATEND, FLGCONFIRMADATA, WEBLOGIN, WEBSENHA, '
      'WEBBASE)'
      'values'
      
        '  (:IDPESSOA, :IDCARTAPADRAO, :IDETIQPADRAO, :IDTIPOATENDPADRAO,' +
        ' '
      ':IDDOCRG, '
      '   :FLGCTRLPROTOCOLO, :IDFIARIOENDINC, :IDFIARIOTELEXC, '
      ':IDFIARIOTELALT, '
      
        '   :IDFIARIOTELINC, :IDFIARIOCCEXC, :IDFIARIOCCALT, :IDFIARIOCCI' +
        'NC, '
      ':IDFIARIOENDEXC, '
      '   :IDFIARIOENDALT, :IDPROTOCOLORUB, :FLGMUDALOCALATEND, '
      ':FLGCONFIRMADATA, '
      '   :WEBLOGIN, :WEBSENHA, :WEBBASE)')
    DeleteSQL.Strings = (
      'delete from PARAMCENTRALAP'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 197
    Top = 305
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Parâmetro'
    CamposChave.Strings = (
      '1')
    Left = 734
    Top = 80
  end
  inherited ds: TwwDataSource
    Left = 165
    Top = 313
  end
  inherited ImlPadrao: TImageList
    Left = 651
    Top = 153
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 534
    Top = 9
  end
  object qryFormaAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOATEND, NOME, FLGEMITERUBS'
      'FROM TIPOATEND'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 424
    Top = 144
    object qryFormaAtendIDTIPOATEND: TFloatField
      FieldName = 'IDTIPOATEND'
      Origin = 'BASEDADOS.TIPOATEND.IDTIPOATEND'
    end
    object qryFormaAtendNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.TIPOATEND.NOME'
      Size = 60
    end
    object qryFormaAtendFLGEMITERUBS: TStringField
      FieldName = 'FLGEMITERUBS'
      Origin = 'BASEDADOS.TIPOATEND.FLGEMITERUBS'
      FixedChar = True
      Size = 1
    end
  end
  object QRYFIARIOASSUNTO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDFIARASS,'
      '  DESCRICAO'
      'FROM FIARIOASSUNTO')
    ValidateWithMask = True
    Left = 512
    Top = 311
    object QRYFIARIOASSUNTODESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.FIARIOASSUNTO.DESCRICAO'
      Size = 100
    end
    object QRYFIARIOASSUNTOIDFIARASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFIARASS'
      Origin = 'BASEDADOS.FIARIOASSUNTO.IDFIARASS'
      Visible = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 666
    Top = 304
  end
  object qrytipodocpessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDDOCUMENTO,'
      '  NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      'ORDER BY NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 304
    Top = 455
  end
  object qryEmpresaProp: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select idpessoa from empresaprop')
    Left = 426
    Top = 307
    object qryEmpresaPropIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.EMPRESAPROP.IDPESSOA'
    end
  end
end
