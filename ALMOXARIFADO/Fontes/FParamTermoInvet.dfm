inherited FrmParamTermoInvent: TFrmParamTermoInvent
  Left = 176
  Top = 146
  Caption = 'Termo de Inventário'
  ClientHeight = 225
  ClientWidth = 394
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 394
    Height = 186
    object RgItem: TRadioGroup
      Left = 24
      Top = 24
      Width = 345
      Height = 73
      Caption = ' Imprimir Itens '
      ItemIndex = 0
      Items.Strings = (
        'Todos os itens '
        'Apenas os que possuem saldo ')
      TabOrder = 0
    end
    object RgOrdem: TRadioGroup
      Left = 24
      Top = 112
      Width = 345
      Height = 49
      Caption = ' Ordem '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Alfabética'
        'Código')
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 186
    Width = 394
    inherited tb97Fundo: TToolbar97
      Left = 218
      DockPos = 218
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 50
      DockPos = 50
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65531
  end
  object qryTermo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      FLGABREFECHA,'
      '      TEXTO'
      'FROM'
      '      TERMOINVENTARIO'
      'WHERE'
      '       (IDPESSOA     = :pIDPESSOA)'
      'ORDER BY  FLGABREFECHA'
      ' ')
    ValidateWithMask = True
    Left = 351
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryTermoFLGABREFECHA: TStringField
      FieldName = 'FLGABREFECHA'
      Origin = 'TERMOINVENTARIO.FLGABREFECHA'
      Size = 1
    end
    object qryTermoTEXTO: TMemoField
      FieldName = 'TEXTO'
      Origin = 'BASEDADOS.TERMOINVENTARIO.TEXTO'
      BlobType = ftMemo
      Size = 1000
    end
  end
end
