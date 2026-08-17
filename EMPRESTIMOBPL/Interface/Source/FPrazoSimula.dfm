inherited frmPrazoSimula: TfrmPrazoSimula
  Left = 303
  Top = 185
  BorderStyle = bsSingle
  Caption = 'Simulação'
  ClientHeight = 423
  ClientWidth = 562
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 562
    Height = 390
    object lstPrazo: TCheckListBox
      Left = 16
      Top = 42
      Width = 528
      Height = 329
      Columns = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 16
      Top = 16
      Width = 529
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Prazo(s) para Simulação'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object btnInvertePrazo: TBitBtn
        Left = 479
        Top = 3
        Width = 24
        Height = 23
        Hint = 'Inverte a Seleção de Prazos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnInvertePrazoClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888488888888888888844888888888888444448888888888444444488
          1888884444444888118884448844888881188448884888888118844888888188
          8118844888881188111888448881111111888884881111111888888888811111
          8888888888881188888888888888818888888888888888888888}
      end
      object btnMarcaTodosPrazo: TBitBtn
        Left = 503
        Top = 3
        Width = 24
        Height = 23
        Hint = 'Seleciona todos os Prazos'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnMarcaTodosPrazoClick
        Glyph.Data = {
          D6000000424DD60000000000000076000000280000000C0000000C0000000100
          0400000000006000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
          0000888224888888000088222248888800008822822488880000882848224888
          0000888224822488000088222248228800008822822482880000882888224888
          0000888888822488000088888888228800008888888882880000}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 390
    Width = 562
    inherited tb97Fundo: TToolbar97
      Left = 390
      DockPos = 442
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 218
      DockPos = 250
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryLookTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   TCE.TCEMAXPARC,'
      '   TCE.TCEMINPARC'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TCE'
      ''
      'WHERE'
      '   TCE.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 112
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryLookTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryLookTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryLookTipoContratoTCEMAXPARC: TFloatField
      FieldName = 'TCEMAXPARC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEMAXPARC'
    end
    object qryLookTipoContratoTCEMINPARC: TFloatField
      FieldName = 'TCEMINPARC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEMINPARC'
    end
  end
end
