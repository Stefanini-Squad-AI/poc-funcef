inherited frmPRel2ViaCCheque: TfrmPRel2ViaCCheque
  Left = 220
  Top = 161
  Caption = 'Parâmetros para a Emissão da 2a. Via de Contra Cheque'
  ClientHeight = 271
  ClientWidth = 435
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 435
    Height = 232
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 433
      Height = 230
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Label7: TLabel
        Left = 15
        Top = 71
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 121
        Width = 37
        Height = 13
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 165
        Top = 74
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblhistorico: TLabel
        Left = 15
        Top = 17
        Width = 104
        Height = 13
        Caption = 'Histórico da Folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 15
        Top = 169
        Width = 63
        Height = 13
        Caption = 'Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edMatricula: TEdit
        Left = 15
        Top = 84
        Width = 120
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edTitular: TEdit
        Left = 15
        Top = 134
        Width = 388
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edNumInscr: TEdit
        Left = 165
        Top = 87
        Width = 120
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object bbtnProcurar: TBitBtn
        Left = 304
        Top = 77
        Width = 93
        Height = 35
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object cmbHistorico: TwwDBLookupCombo
        Left = 15
        Top = 31
        Width = 393
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO')
        LookupTable = qryHistorico
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object cmbRecebedor: TwwDBLookupCombo
        Left = 15
        Top = 184
        Width = 389
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        LookupTable = qryRecebedor
        LookupField = 'IDRECEBEDOR'
        ParentFont = False
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = cmbRecebedorCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 435
    inherited tb97Fundo: TToolbar97
      Left = 259
      DockPos = 439
      inherited sep1: TToolbarSep97
        Left = 83
      end
      inherited sep3: TToolbarSep97
        Left = 169
      end
      inherited bbtnSair: TBitBtn
        Width = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 86
        Width = 83
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 90
      DockPos = 270
      inherited bbtnConfirmar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65515
    Top = 291
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelectBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PARTPREVPLAN.INSCRICAONUMERO'
      'ELEGPATRO.MATRICULA'
      'TITULAR.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Número de Inscrição'
      'Matrícula'
      'Titular')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA TITULAR'
      'ELEGPATRO'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'PARTPREVPLAN.INSCRICAONUMERO'
      'ELEGPATRO.MATRICULA'
      'TITULAR.NOME'
      'TITULAR.IDPESSOA')
    Filtro.Strings = (
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'TITULAR.IDPESSOA = ELEGPATRO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 363
    Top = 154
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from hstfolhabenef'
      'order by idhstfolhabenef desc')
    ValidateWithMask = True
    Left = 205
    Top = 30
  end
  object qryRecebedor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'BF.IDRESPONSAVEL AS IDRECEBEDOR,'
      #9'P.NOME,'
      #9'BF.IDTITULAR,'
      #9#39'B'#39' AS TIPO'
      'FROM'
      #9'BFCIARIOTITPLAN BF,'
      #9'PESSOA P'
      'WHERE BF.IDTITULAR = :TITULAR'
      '  AND P.IDPESSOA = BF.IDRESPONSAVEL'
      ''
      'UNION'
      ''
      'SELECT'
      #9'RI.IDFAVORECIDO AS IDRECEBEDOR,'
      #9'P.NOME,'
      #9'RI.IDPESSOA AS IDTITULAR,'
      #9#39'P'#39' AS TIPO'
      'FROM'
      #9'RUBRICAINDIV RI,'
      #9'PESSOA P'
      'WHERE RI.IDPESSOA = :TITULAR'
      '  AND P.IDPESSOA = RI.IDFAVORECIDO'
      '  AND RI.FLGPENSAOALIM = 1'
      '  AND RI.FLGTPRUBMANUT = 1'
      '')
    ValidateWithMask = True
    Left = 197
    Top = 181
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptInput
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select FlgAgrupaFolhaBen  from paramaprev ')
    ValidateWithMask = True
    Left = 205
    Top = 102
  end
end
