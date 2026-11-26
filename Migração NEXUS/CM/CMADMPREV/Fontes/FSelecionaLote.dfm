inherited frmSelecionaLote: TfrmSelecionaLote
  Left = 208
  Top = 101
  Caption = 'Selecione o Lote para a Concessão ...'
  ClientWidth = 521
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 521
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 5
      Width = 511
      Height = 224
      Selected.Strings = (
        'IDLOTE'#9'10'#9'Lote Nº'
        'DESCRICAO'#9'40'#9'Descrição'
        'MESREFERENCIA'#9'7'#9'Mês de ~Pagamento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsLotesAbertos
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Width = 521
    inherited tb97Fundo: TToolbar97
      Left = 351
      DockPos = 351
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      DockPos = 183
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65523
    Top = 251
  end
  object qryLotesAbertos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, 0 AS FECHALOTE,'
      'NVL(C.FLGINCLUIMESCONC,1) FLGINCLUIMESCONC, DATAPAGAMENTO'
      'FROM   CTRLINTERFACE C'
      'WHERE  C.FLGPREPARADO = 1'
      'AND    C.TIPO = '#39'B'#39
      'AND    C.FLGCONCESSAO =1'
      'AND    C.FLGIDATMP = 0'
      'AND    C.IDPESSOA = :IDFUNDACAO'
      'ORDER BY C.MESREFERENCIA DESC, C.IDLOTE DESC, C.DESCRICAO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsLotesAbertos: TwwDataSource
    DataSet = qryLotesAbertos
    Left = 120
    Top = 232
  end
end
