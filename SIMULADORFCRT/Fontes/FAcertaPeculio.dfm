inherited frmAcertaPeculio: TfrmAcertaPeculio
  Left = 231
  Top = 179
  Caption = 'Acerto do Pecúlio'
  ClientHeight = 221
  ClientWidth = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 409
    Height = 182
    object Label1: TLabel
      Left = 18
      Top = 24
      Width = 360
      Height = 13
      Caption = 'Indique a Faixa de Datas de Migração e a Data Base a Utilizar '
    end
    object Label2: TLabel
      Left = 27
      Top = 63
      Width = 66
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label3: TLabel
      Left = 143
      Top = 63
      Width = 59
      Height = 13
      Caption = 'Data Final'
    end
    object Label4: TLabel
      Left = 258
      Top = 63
      Width = 60
      Height = 13
      Caption = 'Data Base'
    end
    object lblProgresso: TLabel
      Left = 27
      Top = 120
      Width = 73
      Height = 13
      Caption = 'Progresso ...'
    end
    object edDataIni: TEdit
      Left = 27
      Top = 78
      Width = 82
      Height = 21
      TabOrder = 0
    end
    object edDataFim: TEdit
      Left = 143
      Top = 78
      Width = 82
      Height = 21
      TabOrder = 1
    end
    object edDataBase: TEdit
      Left = 258
      Top = 78
      Width = 82
      Height = 21
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 182
    Width = 409
    inherited tb97Fundo: TToolbar97
      Left = 239
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 72
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Acertar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 256
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 24
    Top = 126
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 147
    Top = 117
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 147
    Top = 126
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 78
    Top = 129
  end
end
