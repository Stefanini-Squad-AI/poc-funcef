inherited frmParamContribPlano: TfrmParamContribPlano
  Left = 513
  Top = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Relatorio Analítico de Contribuição por Plano'
  ClientHeight = 282
  ClientWidth = 390
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 390
    Height = 243
    object pnlParticipante: TPanel
      Left = 12
      Top = 11
      Width = 373
      Height = 230
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 15
        Width = 82
        Height = 13
        Caption = 'Mes Cobrança'
      end
      object Label6: TLabel
        Left = 8
        Top = 56
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label7: TLabel
        Left = 8
        Top = 101
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object lblFormato: TLabel
        Left = 9
        Top = 188
        Width = 50
        Height = 13
        Caption = 'Formato:'
      end
      object cbbPatrocinadora: TComboBox
        Left = 9
        Top = 74
        Width = 281
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'CAIXA'
        Items.Strings = (
          'FUNCEF'
          'CAIXA')
      end
      object cbbPlano: TComboBox
        Left = 8
        Top = 119
        Width = 281
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'NOVO PLANO'
        Items.Strings = (
          'REB'
          'NOVO PLANO'
          'REG/REPLAN')
      end
      object edtMesCobr: TMaskEdit
        Left = 8
        Top = 31
        Width = 141
        Height = 21
        EditMask = '####/##;0'
        MaxLength = 7
        TabOrder = 2
        Text = '201601'
      end
      object btnImprimir: TButton
        Left = 184
        Top = 204
        Width = 169
        Height = 25
        Caption = 'Imprimir PDF em partes'
        TabOrder = 3
        Visible = False
        OnClick = btnImprimirClick
      end
      object btnRel: TButton
        Left = 8
        Top = 204
        Width = 169
        Height = 25
        Caption = 'Relatório em tela em partes'
        TabOrder = 4
        Visible = False
        OnClick = btnRelClick
      end
      object btnImprTud: TButton
        Left = 184
        Top = 153
        Width = 169
        Height = 25
        Caption = 'Imprimir PDF'
        TabOrder = 6
        OnClick = btnImprTudClick
      end
      object btnRelTodo: TButton
        Left = 8
        Top = 153
        Width = 169
        Height = 25
        Caption = 'Relatório em tela'
        Default = True
        TabOrder = 5
        OnClick = btnRelTodoClick
      end
      object rbPdf: TRadioButton
        Left = 65
        Top = 188
        Width = 49
        Height = 17
        Caption = 'PDF'
        Checked = True
        TabOrder = 7
        TabStop = True
        OnClick = rbPdfClick
      end
      object rbExcel: TRadioButton
        Left = 121
        Top = 188
        Width = 57
        Height = 17
        Caption = 'Excel'
        TabOrder = 8
        OnClick = rbExcelClick
      end
      object rbTxt: TRadioButton
        Left = 185
        Top = 188
        Width = 49
        Height = 17
        Caption = 'Txt'
        TabOrder = 9
        OnClick = rbTxtClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 243
    Width = 390
    inherited tb97Fundo: TToolbar97
      Left = 218
      DockPos = 261
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 49
      DockPos = 92
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1032
    Top = 65495
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryCount: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 345
    Top = 11
  end
  object qryTot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(VALORESPERADO) TOT_VALORESPERADO, SUM(VALORRECEBIDO) ' +
        'TOT_VALORRECEBIDO'
      '(SELECT '
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERA' +
        'DO) VALORESPERADO,'
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBI' +
        'DO) VALORRECEBIDO'
      '  FROM HSTCONTRIBPREV H'
      '  LEFT JOIN HSTATRASOCONTRIB HA'
      '    ON HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '   AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '   AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '   AND HA.IDMOTIVO = H.IDMOTIVO'
      '  JOIN DEPENTIT DT '
      
        '    ON H.IDPESSOA =DT.IDPESSOA AND NVL(H.IDTITULAR,H.IDPESSOA)=D' +
        'T.IDTITULAR'
      '  JOIN CONTRIBUICAO C'
      '    ON H.IDCONTRIBUICAO = C.IDCONTRIBUICAO'
      '  LEFT JOIN PLANPREV PP'
      '    ON H.IDPLANOPREV = PP.IDPLANOPREV'
      ' WHERE  '
      '    DT.IDPESSOA = H.IDPESSOA'
      '    AND 1 = 2'
      'GROUP BY DT.MATRICULA,'
      '       H.IDPESSOA,'
      '       H.NUMRECEBIMENTO,'
      '       H.MESREFERENCIA,'
      '       H.DATARECEBIMENTO,'
      '       H.IDMOTIVO,'
      '       H.VALOROP1,'
      '       H.IDCONTRIBUICAO,'
      '       PP.NOME ,'
      '       H.MESCOBRANCA,'
      '       NVL(H.SALCONTRIB, 0),'
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORESPERADO, -H.VALORESPERA' +
        'DO) ,'
      
        '       DECODE(H.FLGDEVOLUCAO, 0, H.VALORRECEBIDO, -H.VALORRECEBI' +
        'DO) ,'
      '       C.NOME ) T')
    ValidateWithMask = True
    Left = 349
    Top = 59
    object qryTotTOT_VALORESPERADO: TFloatField
      FieldName = 'TOT_VALORESPERADO'
    end
    object qryTotTOT_VALORRECEBIDO: TFloatField
      FieldName = 'TOT_VALORRECEBIDO'
    end
  end
end
