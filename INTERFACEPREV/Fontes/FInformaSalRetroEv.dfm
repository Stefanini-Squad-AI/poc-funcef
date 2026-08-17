inherited frmInformaSalRetroEv: TfrmInformaSalRetroEv
  Left = 202
  Top = 93
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
      Left = 5
      Top = 5
      Width = 515
      Height = 372
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
      Left = 355
      DockPos = 355
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 96
      DockPos = 96
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 80
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 163
      end
      object bbtnReplicar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Replicar'
        Default = True
        TabOrder = 2
        OnClick = bbtnReplicarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
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
    Params.Data = {
      01000400084944504553534F4100000000094944504553534A55520000000009
      49445255425249434100000000034D455300000000}
    ValidateWithMask = True
    Left = 296
    Top = 240
  end
  object qryParticip: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT EL.IDCARGOEXT,  EL.NIVEL '
      ' FROM  ELEGPATRO EL'
      ' WHERE (EL.IDPESSOA  =  :IDPESSOA)  AND '
      '               (EL.IDPESSJUR =  :IDPESSJUR)'
      '')
    Params.Data = {01000200084944504553534F4100000000094944504553534A555200000000}
    ValidateWithMask = True
    Left = 297
    Top = 289
  end
end
