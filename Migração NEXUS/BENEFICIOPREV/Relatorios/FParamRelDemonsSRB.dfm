inherited frmParamRelDemonsSRB: TfrmParamRelDemonsSRB
  Left = 151
  Top = 68
  Caption = 'Demonstrativo de Cálculo do SRB e INSS'
  ClientHeight = 387
  ClientWidth = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 459
    Height = 348
    object Label3: TLabel
      Left = 24
      Top = 72
      Width = 69
      Height = 13
      Caption = 'Participante'
    end
    object Label4: TLabel
      Left = 24
      Top = 113
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label5: TLabel
      Left = 24
      Top = 158
      Width = 71
      Height = 13
      Caption = 'Inscrição Nº'
    end
    object Label6: TLabel
      Left = 165
      Top = 113
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label7: TLabel
      Left = 165
      Top = 158
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object edParticipante: TEdit
      Left = 24
      Top = 89
      Width = 424
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edMatricula: TEdit
      Left = 24
      Top = 131
      Width = 121
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edNumInsc: TEdit
      Left = 24
      Top = 170
      Width = 121
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edPatrocinadora: TEdit
      Left = 165
      Top = 131
      Width = 283
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edPlano: TEdit
      Left = 165
      Top = 170
      Width = 283
      Height = 21
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 9
      Width = 425
      Height = 58
      TabOrder = 5
      object Label1: TLabel
        Left = 12
        Top = 24
        Width = 145
        Height = 13
        Caption = 'Escolha o Participante ...'
      end
      object bbtnProcurar: TBitBtn
        Left = 312
        Top = 16
        Width = 88
        Height = 33
        Hint = 'Procurar Processo de Benefício'
        Caption = '&Procurar'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
    end
    object pgctrlTipoRelatorio: TPageControl
      Left = 24
      Top = 201
      Width = 424
      Height = 130
      ActivePage = tbsINSS
      TabOrder = 6
      TabPosition = tpBottom
      OnChange = pgctrlTipoRelatorioChange
      object tbsSRB: TTabSheet
        Caption = 'SRB Atuarial'
        object Label2: TLabel
          Left = 6
          Top = 17
          Width = 171
          Height = 13
          Caption = 'Selecione o Cálculo Desejado'
        end
        object dblkpcmbCalculo: TwwDBLookupCombo
          Left = 6
          Top = 33
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODCALCULO'#9'50'#9'Histórico'#9'F'
            'DATACALCULO'#9'15'#9'Data do Cálculo'#9'F'
            'DATAREF'#9'18'#9'Data Base'#9'F'
            'USUARIO'#9'20'#9'Cálculo Feito por ...'#9'F')
          LookupTable = qryCalculo
          LookupField = 'CODCALCULO'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBEdit1: TwwDBEdit
          Left = 186
          Top = 33
          Width = 79
          Height = 21
          Color = clSilver
          DataField = 'DATACALCULO'
          DataSource = dsCalculo
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit2: TwwDBEdit
          Left = 268
          Top = 33
          Width = 147
          Height = 21
          Color = clSilver
          DataField = 'USUARIO'
          DataSource = dsCalculo
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object chkHistRubSal: TCheckBox
          Left = 6
          Top = 66
          Width = 379
          Height = 17
          Caption = 'Emitir Demonstrativo baseado no Histórico de Rubricas'
          TabOrder = 3
        end
      end
      object tbsINSS: TTabSheet
        Caption = 'INSS'
        ImageIndex = 1
        object Label8: TLabel
          Left = 6
          Top = 17
          Width = 248
          Height = 13
          Caption = 'Selecione o Cálculo Desejado (1o. Periodo)'
        end
        object Label10: TLabel
          Left = 6
          Top = 62
          Width = 248
          Height = 13
          Caption = 'Selecione o Cálculo Desejado (2o. Periodo)'
        end
        object dblkpcmbINSS: TwwDBLookupCombo
          Left = 6
          Top = 33
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODCALCULO'#9'50'#9'Histórico'#9'F'
            'DATACALCULO'#9'15'#9'Data do Cálculo'#9'F'
            'DATAREF'#9'18'#9'Data Base'#9'F'
            'USUARIO'#9'20'#9'Cálculo Feito por ...'#9'F')
          LookupTable = qryINSS
          LookupField = 'CODCALCULO'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBEdit3: TwwDBEdit
          Left = 186
          Top = 33
          Width = 79
          Height = 21
          Color = clSilver
          DataField = 'DATACALCULO'
          DataSource = dsINSS
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit4: TwwDBEdit
          Left = 268
          Top = 33
          Width = 147
          Height = 21
          Color = clSilver
          DataField = 'USUARIO'
          DataSource = dsINSS
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 6
          Top = 78
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODCALCULO'#9'50'#9'Histórico'#9'F'
            'DATACALCULO'#9'15'#9'Data do Cálculo'#9'F'
            'DATAREF'#9'18'#9'Data Base'#9'F'
            'USUARIO'#9'20'#9'Cálculo Feito por ...'#9'F')
          LookupTable = qryINSS2
          LookupField = 'CODCALCULO'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBEdit7: TwwDBEdit
          Left = 266
          Top = 78
          Width = 147
          Height = 21
          Color = clSilver
          DataField = 'USUARIO'
          DataSource = dsINSS2
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit8: TwwDBEdit
          Left = 186
          Top = 78
          Width = 79
          Height = 21
          Color = clSilver
          DataField = 'DATACALCULO'
          DataSource = dsINSS2
          ReadOnly = True
          TabOrder = 5
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object tbsSRBBenef: TTabSheet
        Caption = 'SRB'
        ImageIndex = 2
        object Label9: TLabel
          Left = 6
          Top = 17
          Width = 171
          Height = 13
          Caption = 'Selecione o Cálculo Desejado'
        end
        object dblkpcmbCalculo2: TwwDBLookupCombo
          Left = 6
          Top = 33
          Width = 178
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODCALCULO'#9'50'#9'Histórico'#9'F'
            'DATACALCULO'#9'15'#9'Data do Cálculo'#9'F'
            'DATAREF'#9'18'#9'Data Base'#9'F'
            'USUARIO'#9'20'#9'Cálculo Feito por ...'#9'F')
          LookupTable = qryCalculo2
          LookupField = 'CODCALCULO'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBEdit5: TwwDBEdit
          Left = 186
          Top = 33
          Width = 79
          Height = 21
          Color = clSilver
          DataField = 'DATACALCULO'
          DataSource = daCalculo2
          ReadOnly = True
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object wwDBEdit6: TwwDBEdit
          Left = 268
          Top = 33
          Width = 147
          Height = 21
          Color = clSilver
          DataField = 'USUARIO'
          DataSource = daCalculo2
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 459
    inherited tb97Fundo: TToolbar97
      Left = 298
      DockPos = 483
      inherited sep1: TToolbarSep97
        Left = 195
      end
      inherited sep3: TToolbarSep97
        Left = 96
      end
      inherited bbtnSair: TBitBtn
        Width = 96
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 99
        Width = 96
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 185
      inherited ToolbarSep971: TToolbarSep97
        Left = 195
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 96
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 96
        Caption = 'Parcela &A'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
      inherited bbtnCancelar: TBitBtn
        Left = 99
        Width = 96
        Caption = 'Parcela &B'
        ModalResult = 0
        OnClick = bbtnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
      object bbtnINSS: TBitBtn
        Left = 198
        Top = 0
        Width = 96
        Height = 33
        Cancel = True
        Caption = '&INSS'
        TabOrder = 2
        OnClick = bbtnINSSClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 2
    Top = 352
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'SITPART.FLGINTERNO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 25
    Top = 364
  end
  object qryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TO_CHAR(ROWNUM)||'#39'o. Calculo'#39' AS CODCALCULO, C.IDCALCULO,' +
        ' C.INDICETETO, C.INDICEREAJ,'
      '       D.DATACALCULO, D.USUARIO, D.ANOMESREF, C.DATAREF'
      'FROM   CALCULO C,'
      '       (SELECT D.IDCALCULO,'
      '               MAX(D.ANOMESREF) AS ANOMESREF,'
      
        '               MAX(TO_CHAR(D.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39')) AS DAT' +
        'ACALCULO,'
      '               U.NOMEUSUARIO AS USUARIO'
      '        FROM   CALCULO C, DETCALCULO D, USUARIOSISTEMA U'
      '        WHERE  C.IDPESSJUR = :IDPESSJUR'
      '        AND    C.IDPESSOA  = :IDPESSOA'
      '        AND    C.IDREGRA   = 19064 /* 1388 */'
      '        AND    D.IDCALCULO = C.IDCALCULO'
      '        AND    '#39'CM'#39'||TO_CHAR(U.IDUSUARIO)= D.TRGUSERINCLUSAO'
      '        GROUP BY D.IDCALCULO, U.NOMEUSUARIO ) D'
      'WHERE  C.IDPESSJUR = :IDPESSJUR'
      'AND    C.IDPESSOA  = :IDPESSOA'
      'AND    C.IDREGRA   = 19064 /* 1388 */'
      'AND    D.IDCALCULO = C.IDCALCULO'
      'ORDER BY C.DATACALCULO DESC, C.IDCALCULO DESC'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 420
    Top = 171
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsCalculo: TwwDataSource
    AutoEdit = False
    DataSet = qryCalculo
    Left = 429
    Top = 204
  end
  object qryINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TO_CHAR(ROWNUM)||'#39'o. Calculo'#39' AS CODCALCULO, C.IDCALCULO,' +
        ' C.INDICETETO, C.INDICEREAJ,'
      '       D.DATACALCULO, D.USUARIO, D.ANOMESREF, C.DATAREF'
      'FROM   CALCULO C,'
      '       (SELECT D.IDCALCULO,'
      '               MAX(D.ANOMESREF) AS ANOMESREF,'
      
        '               MAX(TO_CHAR(D.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39')) AS DAT' +
        'ACALCULO,'
      '               U.NOMEUSUARIO AS USUARIO'
      '        FROM   CALCULO C, DETCALCULO D, USUARIOSISTEMA U'
      '        WHERE  C.IDPESSJUR = :IDPESSJUR'
      '        AND    C.IDPESSOA  = :IDPESSOA'
      '        AND    C.IDREGRA   = 1377'
      '        AND    D.IDCALCULO = C.IDCALCULO'
      '        AND    '#39'CM'#39'||TO_CHAR(U.IDUSUARIO)= D.TRGUSERINCLUSAO'
      '        GROUP BY D.IDCALCULO, U.NOMEUSUARIO ) D'
      'WHERE  C.IDPESSJUR = :IDPESSJUR'
      'AND    C.IDPESSOA  = :IDPESSOA'
      'AND    C.IDREGRA   = 1377'
      'AND    D.IDCALCULO = C.IDCALCULO'
      'ORDER BY C.DATACALCULO DESC, C.IDCALCULO DESC'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 414
    Top = 99
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsINSS: TwwDataSource
    AutoEdit = False
    DataSet = qryINSS
    Left = 414
    Top = 81
  end
  object qryCalculo2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TO_CHAR(ROWNUM)||'#39'o. Calculo'#39' AS CODCALCULO, C.IDCALCULO,' +
        ' C.INDICETETO, C.INDICEREAJ,'
      '       D.DATACALCULO, D.USUARIO, D.ANOMESREF, C.DATAREF'
      'FROM   CALCULO C,'
      '       (SELECT D.IDCALCULO,'
      '               MAX(D.ANOMESREF) AS ANOMESREF,'
      
        '               MAX(TO_CHAR(D.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39')) AS DAT' +
        'ACALCULO,'
      '               U.NOMEUSUARIO AS USUARIO'
      '        FROM   CALCULO C, DETCALCULO D, USUARIOSISTEMA U'
      '        WHERE  C.IDPESSJUR = :IDPESSJUR'
      '        AND    C.IDPESSOA  = :IDPESSOA'
      '        AND    C.IDREGRA   <> 19064 /* 1388 */'
      '        AND    D.IDCALCULO = C.IDCALCULO'
      '        AND    D.TIPOCALCULO = '#39'RA1'#39
      '        AND    '#39'CM'#39'||TO_CHAR(U.IDUSUARIO)= D.TRGUSERINCLUSAO'
      '        GROUP BY D.IDCALCULO, U.NOMEUSUARIO ) D'
      'WHERE  C.IDPESSJUR = :IDPESSJUR'
      'AND    C.IDPESSOA  = :IDPESSOA'
      'AND    C.IDREGRA   <> 19064 /* 1388 */'
      'AND    D.IDCALCULO = C.IDCALCULO'
      'ORDER BY C.DATACALCULO DESC, C.IDCALCULO DESC'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 516
    Top = 165
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object daCalculo2: TwwDataSource
    AutoEdit = False
    DataSet = qryCalculo2
    Left = 525
    Top = 198
  end
  object dsINSS2: TwwDataSource
    AutoEdit = False
    DataSet = qryINSS2
    Left = 285
    Top = 15
  end
  object qryINSS2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TO_CHAR(ROWNUM)||'#39'o. Calculo'#39' AS CODCALCULO, C.IDCALCULO,' +
        ' C.INDICETETO, C.INDICEREAJ,'
      '       D.DATACALCULO, D.USUARIO, D.ANOMESREF, C.DATAREF'
      'FROM   CALCULO C,'
      '       (SELECT D.IDCALCULO,'
      '               MAX(D.ANOMESREF) AS ANOMESREF,'
      
        '               MAX(TO_CHAR(D.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39')) AS DAT' +
        'ACALCULO,'
      '               U.NOMEUSUARIO AS USUARIO'
      '        FROM   CALCULO C, DETCALCULO D, USUARIOSISTEMA U'
      '        WHERE  C.IDPESSJUR = :IDPESSJUR'
      '        AND    C.IDPESSOA  = :IDPESSOA'
      '        AND    C.IDREGRA   = 19007'
      '        AND    D.IDCALCULO = C.IDCALCULO'
      '        AND    '#39'CM'#39'||TO_CHAR(U.IDUSUARIO)= D.TRGUSERINCLUSAO'
      '        GROUP BY D.IDCALCULO, U.NOMEUSUARIO ) D'
      'WHERE  C.IDPESSJUR = :IDPESSJUR'
      'AND    C.IDPESSOA  = :IDPESSOA'
      'AND    C.IDREGRA   = 19007'
      'AND    D.IDCALCULO = C.IDCALCULO'
      'ORDER BY C.DATACALCULO DESC, C.IDCALCULO DESC'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 285
    Top = 33
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
