inherited frmdivergeRecebimento: TfrmdivergeRecebimento
  Left = 152
  Top = 72
  Caption = 'Relatório de Tratamento de Divergências'
  ClientHeight = 424
  ClientWidth = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 493
    Height = 385
    object GroupBox4: TGroupBox
      Left = 11
      Top = 16
      Width = 470
      Height = 65
      Caption = 'Período'
      TabOrder = 1
      object Label1: TLabel
        Left = 56
        Top = 32
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label2: TLabel
        Left = 263
        Top = 32
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object cmbmes: TComboBox
        Left = 98
        Top = 26
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
        TabOrder = 0
      end
      object spinano: TSpinEdit
        Left = 296
        Top = 26
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object Participante: TGroupBox
      Left = 11
      Top = 90
      Width = 470
      Height = 63
      Caption = 'Participante'
      TabOrder = 0
      object Label4: TLabel
        Left = 9
        Top = 33
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object SpeedButton1: TSpeedButton
        Left = 383
        Top = 20
        Width = 39
        Height = 29
        Hint = 'Procurar'
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
          FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
          FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
          333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
          333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
          777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
          FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
          FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
          333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
          88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
          F777333333333088FFF003333333333337333337733333333333088FFF033333
          333333337F33337333333333333308FFF09333333333333378F3373333333333
          333330FF0933333333333333378F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 421
        Top = 20
        Width = 37
        Height = 29
        Hint = 'Limpar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object edparticipante: TEdit
        Left = 56
        Top = 27
        Width = 313
        Height = 21
        Cursor = crArrow
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Text = 'edparticipante'
        OnMouseMove = edparticipanteMouseMove
      end
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 247
      Width = 483
      Height = 133
      ActivePage = TabSheet1
      Align = alBottom
      TabOrder = 2
      object TabSheet1: TTabSheet
        Caption = 'Patrocinadora'
        object chkpatrocinadora: TCheckListBox
          Left = 0
          Top = 0
          Width = 475
          Height = 105
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Plano Assistencial'
        object chkplano: TCheckListBox
          Left = 0
          Top = 0
          Width = 475
          Height = 105
          Align = alClient
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 240
      Top = 160
      Width = 241
      Height = 74
      Caption = 'Contribuições'
      TabOrder = 3
      object chkdivergencias: TCheckBox
        Left = 16
        Top = 22
        Width = 137
        Height = 17
        Caption = 'Com Divergências'
        Enabled = False
        TabOrder = 0
      end
      object chkenviadas: TCheckBox
        Left = 16
        Top = 49
        Width = 169
        Height = 17
        Caption = 'Enviadas não Recebidas'
        Enabled = False
        TabOrder = 1
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 12
      Top = 160
      Width = 221
      Height = 73
      Caption = 'Tipo'
      ItemIndex = 0
      Items.Strings = (
        'Contribuições'
        'Divergências Tratadas')
      TabOrder = 4
      OnClick = RadioGroup1Click
    end
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 493
    inherited tb97Fundo: TToolbar97
      Left = 320
      DockPos = 320
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 152
      DockPos = 152
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 419
    Top = 299
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrypatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PAT.IDPESSOA, PAT.NOME'
      'FROM   PESSOA PAT'
      'WHERE  FLGPATROCINADORA=1')
    ValidateWithMask = True
    Left = 112
    Top = 288
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select idplanass, nome '
      'from planass')
    ValidateWithMask = True
    Left = 208
    Top = 296
  end
  object procuraPart: TMontaSelect
    Caption = 'Seleciona'
    Colunas.Strings = (
      'BENEFASS.IDTITULAR'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'Inscrição Previdenciaria')
    Tabelas.Strings = (
      'PESSOA'
      'BENEFASS'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.IDPESSOA'
      'PARTPREVPLAN.INSCRICAONUMERO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA =  BENEFASS.IDTITULAR')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    Left = 308
    Top = 290
  end
end
T
