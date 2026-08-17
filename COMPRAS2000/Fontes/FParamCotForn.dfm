inherited FrmParamCotForn: TFrmParamCotForn
  Left = 84
  Top = 179
  Caption = 'Cotação por Fornecedores'
  ClientHeight = 167
  ClientWidth = 386
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 386
    Height = 128
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Nº do Processo'
    end
    object cmpForn: TCMProcuraForCli
      Left = 16
      Top = 64
      Width = 353
      Height = 50
      Caption = ' Fornecedor '
      TabOrder = 0
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = 'Chave não pode estar em branco'
      Mensagens.NaoExiste = 'Chave não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      ForCli = fcFornecedor
      MostraEndereco = False
      StatusForCli = fcAll
    end
    object dblcProc: TCMDBLookupCombo
      Left = 16
      Top = 32
      Width = 161
      Height = 21
      DropDownAlignment = taLeftJustify
      LookupTable = qryProc
      LookupField = 'CODPROCESSO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 128
    Width = 386
    inherited tb97Fundo: TToolbar97
      Left = 216
      DockPos = 216
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 48
      DockPos = 48
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65523
  end
  object qryProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'P.CODPROCESSO'
      'FROM'#9
      #9'COTACOES C,'
      '      PROCESSO P     '
      'WHERE'
      '       (P.IDCOMPRADOR = :IDCOMPRADOR)'
      '   AND (P.CODPROCESSO = C.CODPROCESSO)    '
      'GROUP BY P.CODPROCESSO'
      'ORDER BY P.CODPROCESSO')
    ValidateWithMask = True
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCOMPRADOR'
        ParamType = ptUnknown
      end>
    object qryProcCODPROCESSO: TFloatField
      DisplayLabel = 'Nº do Processo'
      FieldName = 'CODPROCESSO'
      Origin = 'PROCESSO.CODPROCESSO'
    end
  end
end
