inherited frmInformaSalRetroEv: TfrmInformaSalRetroEv
  Left = 90
  Top = 91
  Caption = 'Informa Salários Retroativos (Ativo)'
  ClientHeight = 421
  ClientWidth = 525
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 525
    Height = 382
    object stgridresult: TStringGrid
      Left = 1
      Top = 1
      Width = 523
      Height = 380
      Align = alClient
      ColCount = 3
      DefaultColWidth = 67
      DefaultRowHeight = 20
      FixedColor = 13224393
      FixedCols = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      OnKeyDown = stgridresultKeyDown
      OnSelectCell = stgridresultSelectCell
      ColWidths = (
        279
        123
        103)
    end
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 525
    inherited tb97Fundo: TToolbar97
      Left = 350
      DockPos = 350
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 181
      DockPos = 181
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 227
    Top = 239
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 344
    Top = 240
  end
  object qrySalario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT  H.VALORPROVENTO'
      ' FROM     HISTRUBSAL H'
      ' WHERE (H.IDPESSOA  =  :IDPESSOA)  AND '
      ' (H.IDPESSJUR =  :IDPESSJUR)     AND '
      ' (H.IDRUBRICA =  :IDRUBRICA)      AND '
      ' (H.MES =  :MES )                             ')
    ValidateWithMask = True
    Left = 296
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MES'
        ParamType = ptUnknown
      end>
  end
  object qryParticip: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT EL.IDCARGOEXT,  EL.NIVEL '
      ' FROM  ELEGPATRO EL'
      ' WHERE (EL.IDPESSOA  =  :IDPESSOA)  AND '
      '               (EL.IDPESSJUR =  :IDPESSJUR)'
      '')
    ValidateWithMask = True
    Left = 297
    Top = 289
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
