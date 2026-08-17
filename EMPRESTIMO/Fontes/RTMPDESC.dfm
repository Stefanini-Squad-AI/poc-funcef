inherited frmRelTMPDESC: TfrmRelTMPDESC
  Left = 4
  Top = 100
  Caption = 'Consulta Valores Folha'
  ClientHeight = 440
  ClientWidth = 774
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 774
    Height = 407
    inherited pgcControle: TPageControl
      Width = 774
      Height = 374
      inherited TabSheet1: TTabSheet
        object GroupBox1: TGroupBox
          Left = 32
          Top = 184
          Width = 337
          Height = 41
          Caption = ' Forma(s) de Envio '
          TabOrder = 3
          object chkFolhaPatro: TCheckBox
            Left = 16
            Top = 17
            Width = 137
            Height = 17
            Caption = 'Folha Patrocinadora'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkFolhaBenef: TCheckBox
            Left = 176
            Top = 17
            Width = 137
            Height = 17
            Caption = 'Folha de Benefícios'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object Panel3: TPanel
          Left = 384
          Top = 112
          Width = 337
          Height = 57
          TabOrder = 2
          object Label1: TLabel
            Left = 112
            Top = 10
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object chkCobranca: TCheckBox
            Left = 16
            Top = 26
            Width = 105
            Height = 17
            Caption = 'aplicar filtro:   '
            TabOrder = 0
          end
          object DBspnAnoCobranca: TwwDBSpinEdit
            Left = 256
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object cboMesCobranca: TComboBox
            Left = 112
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
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
          end
        end
        object Panel5: TPanel
          Left = 32
          Top = 112
          Width = 337
          Height = 57
          TabOrder = 1
          object Label4: TLabel
            Left = 112
            Top = 10
            Width = 124
            Height = 13
            Caption = 'Referência (mês/ano)'
          end
          object chkReferencia: TCheckBox
            Left = 16
            Top = 26
            Width = 105
            Height = 17
            Caption = 'aplicar filtro:   '
            TabOrder = 0
          end
          object DBspnAnoReferencia: TwwDBSpinEdit
            Left = 256
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object cboMesReferencia: TComboBox
            Left = 112
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
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
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 24
          Top = 56
          Width = 705
          Height = 41
          inherited edtNome: TEdit
            Width = 449
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 648
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 672
          end
        end
        object rdgSitEnvio: TRadioGroup
          Left = 384
          Top = 184
          Width = 337
          Height = 121
          Caption = ' Exibir: '
          ItemIndex = 5
          Items.Strings = (
            'Apenas Rubricas já processadas pelo Empréstimo'
            'Apenas Rubricas NÃO Recebidas'
            'Apenas Rubricas Recebidas'
            'Apenas Rubricas Recebidas com Resíduo'
            'Apenas Rubricas Recebidas sem Resíduo'
            'Todas as Rubricas')
          TabOrder = 4
        end
        object rdgOrdenacao: TRadioGroup
          Left = 32
          Top = 312
          Width = 689
          Height = 41
          Caption = ' Ordenar por: '
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Mês de Cobrança'
            'Nome do Mutuário'
            'Nº do Contrato')
          TabOrder = 5
        end
      end
      inherited TabSheet2: TTabSheet
        object DBgrdHistMov: TwwDBGrid
          Left = 17
          Top = 34
          Width = 736
          Height = 319
          Selected.Strings = (
            'IDDESCONTO'#9'15'#9'Contrato'#9'F'
            'ORDEM'#9'15'#9'Ordem'#9'F'
            'NOME'#9'30'#9'Mutuário'#9'F'
            'MESCOBRANCA'#9'7'#9'Cob.'#9'F'
            'MESREFERENCIA'#9'7'#9'Ref.'#9'F'
            'FLGDESCFOLHA'#9'2'#9' '#9'F'
            'PARC'#9'7'#9'Parc.'#9'F'
            'VALOR'#9'13'#9'Valor'#9'F'
            'VALORRECEBIDO'#9'13'#9'Vlr.Receb'#9'F'
            'DATARECEBIMENTO'#9'11'#9'Data Receb'#9'F'
            'NUMSITENVIO'#9'2'#9' '#9'F'
            'SITENVIO'#9'12'#9'Situação'#9'F'
            'IDPROVENTO'#9'12'#9'Rub. Int.'#9'F'
            'CODPROVDESC'#9'12'#9'Rub.Ext.'#9'F'
            'IDLOTE'#9'10'#9'Lote'#9'F'
            'LOTEPREVIA'#9'10'#9'Lote Prévia'#9'F'
            'TRGDTINCLUSAO'#9'18'#9'Data Inclusão'#9'F'
            'TRGUSERINCLUSAO'#9'20'#9'Usuário'#9'F'
            'IDHISTMOVEMPTMO'#9'20'#9'IDHistMovEmptmo'#9'F'
            'IDTMPDESC'#9'13'#9'IDTmpDesc'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsTMPDESC
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel4: TPanel
          Left = 16
          Top = 8
          Width = 737
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Valores a Receber - Folha(s)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    inherited Panel1: TPanel
      Width = 774
      inherited fcLabel1: TfcLabel
        Width = 343
        Caption = 'Consulta Valores Folha [ seleção ]'
      end
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 9
        Height = 9
      end
      object pnlBaca: TPanel
        Left = 533
        Top = 0
        Width = 241
        Height = 33
        TabOrder = 0
        Visible = False
        object btnAltera: TfcShapeBtn
          Left = 84
          Top = 3
          Width = 73
          Height = 27
          Caption = 'Alterar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsFlat
          TabOrder = 0
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = btnAlteraClick
        end
        object btnNovo: TfcShapeBtn
          Left = 4
          Top = 3
          Width = 73
          Height = 27
          Caption = 'Novo'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clOlive
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Enabled = False
          NumGlyphs = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsFlat
          TabOrder = 1
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
        end
        object btnExcluir: TfcShapeBtn
          Left = 164
          Top = 3
          Width = 73
          Height = 27
          Caption = 'Excluir'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsFlat
          TabOrder = 2
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = btnExcluirClick
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 774
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        OnClick = bbtnAjudaClick
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep973: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65531
  end
  object qryTmpDesc: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   TMP.IDTMPDESC, TMP.IDDESCONTO, TMP.ORDEM, TMP.IDHISTMOVEMPTMO' +
        ','
      '   TMP.IDPESSJUR, TMP.IDPLANOPREV,'
      '   TMP.IDMODULO, TMP.IDEMPRESAPROP,'
      '   TMP.MESCOBRANCA, TMP.MESREFERENCIA,'
      
        '   TMP.IDPESSOA, TMP.IDTITULAR, TMP.MATRICULA, TMP.INSCRICAONUME' +
        'RO,'
      
        '   TMP.FLGDESCFOLHA, TMP.FLGTIPODESC, TMP.IDPROVENTO, TMP.CODPRO' +
        'VDESC,'
      ''
      '   TMP.DATAREFERENCIA, TMP.DATACOBRANCA, TMP.DATARECEBIMENTO,'
      '   TMP.REFERENCIA,'
      '   TMP.FLGATRASODEVOL,'
      ''
      '   TMP.IDLOTE, TMP.LOTEPREVIA,'
      ''
      '   TMP.SITENVIO AS NUMSITENVIO,'
      ''
      '   DECODE(TMP.SITENVIO, '#39'0'#39', '#39'Em cobrança'#39','
      '                        '#39'1'#39', '#39'Rec. Diverg.'#39','
      '                        '#39'2'#39', '#39'Rec. OK'#39','
      '                        '#39'X'#39', '#39'NÃO Recebido'#39','
      '                        '#39'9'#39', '#39'Baixado EP'#39
      '         ) AS SITENVIO  ,'
      ''
      '   TMP.TRGDTINCLUSAO    ,'
      '   TMP.TRGUSERINCLUSAO  ,'
      ''
      '   TMP.VALORINFO        ,'
      ''
      '   TMP.PARCELA, TMP.NUMPARCELAS,'
      ''
      
        '   TO_CHAR(TMP.PARCELA, '#39'00'#39') || '#39'/'#39' || TO_CHAR(TMP.NUMPARCELAS,' +
        ' '#39'00'#39') AS PARC,'
      ''
      '   TMP.VALOR         AS VALOR,'
      '   TMP.VALORRECEBIDO AS VALORRECEBIDO,'
      ''
      '   MUT.NOME             ,'
      '   CON.FLGSITUACAO      ,'
      ''
      '   CON.IDTIPOCONTREMPTMO'
      'FROM'
      '   TMPDESC        TMP,'
      '   CONTRATOEMPTMO CON,'
      '   PESSOA         MUT'
      ''
      'WHERE'
      '       TMP.IDMODULO           = 15'
      '   AND TMP.IDDESCONTO         =:PIDDESCONTO'
      '   AND TMP.FLGTIPODESC        = '#39'E'#39
      ''
      
        '   AND ( :PIDPESSOA           IS NULL OR TMP.IDPESSOA          =' +
        ':PIDPESSOA  )'
      
        '   AND ( :PIDPESSOA           IS NULL OR CON.IDBENEF           =' +
        ':PIDPESSOA  )'
      ''
      
        '   AND ( :PIDDESCONTO         IS NULL OR CON.IDCONTRATOEMPTMO  =' +
        ':PIDDESCONTO )'
      ''
      
        '   AND ( :PMESCOBRANCA        IS NULL OR TMP.MESCOBRANCA       =' +
        ':PMESCOBRANCA )'
      
        '   AND ( :PMESREFERENCIA      IS NULL OR TMP.MESREFERENCIA     =' +
        ':PMESREFERENCIA )'
      ''
      '   AND ( (:PFLGDESCFOLHA      IS NULL)'
      '         OR (:PFLGDESCFOLHA   = 1 AND TMP.FLGDESCFOLHA = '#39'P'#39' )'
      '         OR (:PFLGDESCFOLHA   = 2 AND TMP.FLGDESCFOLHA = '#39'B'#39' )'
      '       )'
      ''
      '   AND ( (:PSITENVIO          = 5 )'
      '       OR (:PSITENVIO         = 0 AND SITENVIO = '#39'9'#39' )'
      '       OR (:PSITENVIO         = 1 AND SITENVIO IN ('#39'0'#39', '#39'X'#39') )'
      '       OR (:PSITENVIO         = 2 AND SITENVIO IN ('#39'1'#39', '#39'2'#39') )'
      '       OR (:PSITENVIO         = 3 AND SITENVIO = '#39'1'#39' )'
      '       OR (:PSITENVIO         = 4 AND SITENVIO = '#39'2'#39' )'
      '       )'
      ''
      '   AND TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDBENEF            = MUT.IDPESSOA'
      ''
      'ORDER BY'
      
        '   DECODE(:PORDENACAO, 0, TMP.MESCOBRANCA, 1, MUT.NOME, TMP.IDDE' +
        'SCONTO),'
      '   TMP.IDDESCONTO, TMP.MESCOBRANCA, TMP.MESREFERENCIA'
      ' ')
    ValidateWithMask = True
    Left = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
        Value = '235227'
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
        Value = '26999'
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDDESCONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
        Value = '2003/01'
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
        Value = '2003/01'
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGDESCFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSITENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PORDENACAO'
        ParamType = ptInput
      end>
    object qryTmpDescIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryTmpDescORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object qryTmpDescMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryTmpDescIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryTmpDescFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryTmpDescDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryTmpDescIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryTmpDescIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryTmpDescIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryTmpDescINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryTmpDescCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryTmpDescFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object qryTmpDescREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object qryTmpDescFLGATRASODEVOL: TStringField
      FieldName = 'FLGATRASODEVOL'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescDATACOBRANCA: TDateTimeField
      FieldName = 'DATACOBRANCA'
    end
    object qryTmpDescIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qryTmpDescTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryTmpDescTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTmpDescLOTEPREVIA: TFloatField
      FieldName = 'LOTEPREVIA'
    end
    object qryTmpDescVALORINFO: TFloatField
      FieldName = 'VALORINFO'
    end
    object qryTmpDescNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryTmpDescFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryTmpDescVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryTmpDescSITENVIO: TStringField
      FieldName = 'SITENVIO'
      Size = 12
    end
    object qryTmpDescIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
    object qryTmpDescIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryTmpDescNUMSITENVIO: TStringField
      FieldName = 'NUMSITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescPARCELA: TFloatField
      FieldName = 'PARCELA'
    end
    object qryTmpDescNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryTmpDescPARC: TStringField
      FieldName = 'PARC'
      Size = 7
    end
  end
  object dtsTMPDESC: TwwDataSource
    AutoEdit = False
    DataSet = qryTmpDesc
    Left = 488
  end
end
