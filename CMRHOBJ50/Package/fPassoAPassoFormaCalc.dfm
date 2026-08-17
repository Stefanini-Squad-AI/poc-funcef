inherited frmPassoAPassoFormaCalc: TfrmPassoAPassoFormaCalc
  Left = 125
  Top = 145
  Width = 550
  Height = 393
  BorderIcons = [biMaximize]
  BorderStyle = bsSizeToolWin
  Caption = 'Passo a Passo da Forma de Cálculo Nº'
  Constraints.MinHeight = 393
  Constraints.MinWidth = 550
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 542
    Height = 327
    BorderWidth = 2
    object rcedPasso: TRichEdit
      Left = 8
      Top = 8
      Width = 526
      Height = 311
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Lucida Console'
      Font.Style = []
      Lines.Strings = (
        'F%SE(C(TEMLANCAMENTO) = 1;'
        '  C(VALORRUBRICA);'
        ''
        '  F%SE(F%DATANUM(C(DATASALARIO)) <= F%DATANUM(C(NORMALINI));'
        '    C(BSRUBRICA);'
        ''
        '    F%SE(F%DATANUM(C(DATASALARIO)) = F%DATANUM(C(DATAADMISSAO));'
        '      C(BSRUBRICA);'
        ''
        '      F%SE(F%DATANUM(C(DATASALARIO)) > F%DATANUM(C(NORMALFIM));'
        '        F%SOMAHISTRUB(002; C(NORMALFIM); 1; 1);'
        '        C(BSRUBRICA) / 30 * F%DIASTRAB(C(NORMALFIM); 4)'
        '      )'
        '    )'
        '  )'
        ')')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 327
    Width = 542
    inherited tb97Fundo: TToolbar97
      Left = 202
      inherited sep1: TToolbarSep97
        Left = 254
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 92
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 174
        Enabled = False
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 256
      end
      object bbtnCancelar: TBitBtn
        Left = 94
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 92
        Height = 33
        Caption = ' &Próximo'
        Default = True
        ModalResult = 1
        TabOrder = 3
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
          66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
          66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
          660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 147
    Top = 243
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
end
