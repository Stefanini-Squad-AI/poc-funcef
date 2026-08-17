object frmOpcoesExportacaoDirf: TfrmOpcoesExportacaoDirf
  Left = 218
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Opções de Exportação'
  ClientHeight = 410
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 9
    Top = 5
    Width = 69
    Height = 13
    Caption = 'Destination file'
  end
  object pnlSuperior: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 67
    Align = alTop
    TabOrder = 0
    object laFileName: TLabel
      Left = 9
      Top = 5
      Width = 88
      Height = 13
      Caption = 'Arquivo de destino'
    end
    object btSelecione: TButton
      Left = 378
      Top = 20
      Width = 75
      Height = 22
      Caption = 'Selecionar...'
      TabOrder = 0
      OnClick = btSelecioneClick
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 67
    Width = 460
    Height = 305
    Align = alTop
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 458
      Height = 303
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Tipos de Formatos'
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 450
          Height = 217
          ActivePage = TabSheet2
          Align = alTop
          TabOrder = 0
          object TabSheet2: TTabSheet
            Caption = 'Formatos'
            object rbOpcoes: TRadioGroup
              Left = 8
              Top = 0
              Width = 425
              Height = 177
              Caption = '  Exportar para  '
              Columns = 3
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 372
    Width = 460
    Height = 38
    Align = alClient
    TabOrder = 2
    object btExportar: TButton
      Left = 289
      Top = 4
      Width = 85
      Height = 25
      Caption = '&Exportar'
      Default = True
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btExportarClick
    end
    object btFechar: TButton
      Left = 376
      Top = 4
      Width = 85
      Height = 25
      Cancel = True
      Caption = '&Fechar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object edFileName: TEdit
    Left = 10
    Top = 20
    Width = 361
    Height = 21
    TabOrder = 3
    OnChange = edFileNameChange
  end
  object chShowFile: TCheckBox
    Left = 11
    Top = 45
    Width = 183
    Height = 17
    Caption = 'Abrir após exportação'
    TabOrder = 4
  end
  object sdSalvarArquivo: TSaveDialog
    Left = 28
    Top = 319
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 0 as Envio, C.CONNUMERO AS CONTRATO, DD.CODDOCUMENTO AS D' +
        'OCUMENTO, '
      ''
      
        'DD.DATAVENCIMENTO as DATA_VENCIMENTO, LOC.NOME AS LOCATARIO, FIA' +
        'DOR.NOME AS '
      ''
      'FIADOR, '
      
        'DECODE(C.FLGFIANCA,'#39'A'#39','#39'Fiador'#39','#39'F'#39','#39'Fiança Bancária'#39','#39'O'#39','#39'Outra' +
        #39','#39'S'#39','#39'Seguro '
      ''
      
        'Fiança'#39','#39'D'#39','#39'Depósito Bancário'#39','#39'N'#39','#39'Não há'#39','#39'Não há'#39') as TIPO_D' +
        'E_FIANCA,'
      
        'END.IDIMOVELMESTRE AS ENDERECO, (To_Number(DD.TOT_RECEBER) - To_' +
        'Number'
      ''
      
        '(DD.RECEBIDO)) as SALDO, DECODE (dd.dataAvisocobranca, null,'#39'Não' +
        ' Enviado'#39','#39'Enviado'#39') as STATUS, dd.dataAvisocobranca     '
      'FROM CONTRATOIMOVEL C , '
      
        '(SELECT IML.IDIMOVEL, IML.IDIMOVELMESTRE, IML.IMOLOGRADOURO ENDE' +
        'RECO, '
      ''
      'CXI.IDCONTRATOIMOVEL FROM '
      'IMOVEL IML, CONTRATOXIMOVEL CXI'
      'WHERE IML.IDIMOVEL = CXI.IDIMOVEL) END,'
      
        '(SELECT VXC.IDCONTRATOIMOVEL, PESS.NOME FROM AVALISTAXCONTRATO V' +
        'XC,'
      'PESSOA PESS'
      'WHERE PESS.IDPESSOA = VXC.IDAVALISTA) FIADOR,'
      '(SELECT NOME,IDPESSOA FROM PESSOA) LOC,'
      
        '(SELECT LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,' +
        '           '
      '      SUM( '
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE'
      ''
      
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE'
      ''
      
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE'
      ''
      
        '(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0' +
        ') + '
      
        '          DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG, '#39'R'#39',' +
        'DECODE'
      ''
      
        '(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALO' +
        'R * (-1) '
      '* LI.VLRLANCRECEB / TRD.VALOR), 0), 0) ) AS TOT_RECEBER,  '
      
        'NVL(SUM( DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG, '#39'R'#39', L' +
        'D.VALOR, 0), 0) '
      
        '* LI.VLRLANCRECEB / TRD.VALOR  ),0) AS RECEBIDO, ld.dataavisocob' +
        'ranca      '
      
        'FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOV' +
        'EL '
      ''
      'T,CONTRATOIMOVEL C, '
      
        '(SELECT CODDOCUMENTO, DECODE(VALOR, 0, 1, VALOR) AS VALOR  FROM ' +
        'LANCTODOCUM '
      
        'WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' OR RTRIM(OP' +
        'ERACAO) = '#39'3'#39') '
      ''
      'TRD '
      '   WHERE ( D.RECPAG = '#39'R'#39')'
      
        '     AND ( C.FLGTIPOCONTRATO IN ('#39'L'#39','#39'D'#39') OR LI.IDCONTRATOIMOVEL' +
        ' IS NULL )'
      '     AND ( LD.ESTORNO IS NULL ) '
      '     AND ( LI.FLGESTORNADO IS NULL ) '
      '     AND ( LI.CODDOCUMENTO NOT IN '
      
        '( SELECT IDDOCUMENTO FROM CONCILIADOC WHERE FLGTIPO = '#39'A'#39' AND ID' +
        'PARCFINANCIMOV '
      ''
      'IS NULL AND DATA <= SYSDATE ) )'
      '     AND ( LD.DATALANCTO <= SYSDATE ) '
      '     AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )        '
      '     AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )           '
      '     AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )'
      '     AND ( D.STATUS <> 2 )'
      '     AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )            '
      '     AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ) '
      '     AND (  LD.DATALANCTO > TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39'))'
      '     AND LI.DATAVENCIMENTO > (SYSDATE - :PPERIODO)'
      '     AND LI.DATAVENCIMENTO < SYSDATE '
      
        'GROUP BY  LI.CODDOCUMENTO,  LI.IDCONTRATOIMOVEL,LI.DATAVENCIMENT' +
        'O,           '
      
        '      LI.DATALIMITE, LI.CODTIPIMOVEL,  LI.IDTIPOCUSTORECIMO, ld.' +
        'dataavisocobranca  '
      '      ) DD'
      'WHERE  ( C.IDCONTRATOIMOVEL = DD.IDCONTRATOIMOVEL )'
      '   AND (To_Number(DD.TOT_RECEBER) - To_Number(DD.RECEBIDO)) > 0'
      '   AND (END.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL)'
      '   AND (C.IDLOCATARIO = LOC.IDPESSOA)'
      '   AND (FIADOR.IDCONTRATOIMOVEL (+)= c.IDCONTRATOIMOVEL)'
      'GROUP BY DD.CODDOCUMENTO,    '
      
        '   DD.TOT_RECEBER,   DD.RECEBIDO , C.IDCONTRATOIMOVEL,  C.CONNUM' +
        'ERO, '
      
        '   C.IDLOCATARIO, DD.dataAvisocobranca, END.IDIMOVELMESTRE, C.FL' +
        'GFIANCA, '
      ''
      'LOC.NOME, FIADOR.NOME, DD.DATAVENCIMENTO'
      'order by C.IDCONTRATOIMOVEL')
    ControlType.Strings = (
      'ENVIO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 264
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PPERIODO'
        ParamType = ptUnknown
      end>
    object qryENVIO: TFloatField
      FieldName = 'ENVIO'
    end
    object qryCONTRATO: TStringField
      FieldName = 'CONTRATO'
    end
    object qryDOCUMENTO: TFloatField
      FieldName = 'DOCUMENTO'
    end
    object qryDATA_VENCIMENTO: TDateTimeField
      FieldName = 'DATA_VENCIMENTO'
    end
    object qryLOCATARIO: TStringField
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object qryFIADOR: TStringField
      FieldName = 'FIADOR'
      Size = 60
    end
    object qryTIPO_DE_FIANCA: TStringField
      FieldName = 'TIPO_DE_FIANCA'
      Size = 17
    end
    object qryENDERECO: TFloatField
      FieldName = 'ENDERECO'
    end
    object qrySALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryDATAAVISOCOBRANCA: TDateTimeField
      DisplayLabel = 'TESTE1'
      FieldName = 'DATAAVISOCOBRANCA'
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Size = 11
    end
  end
end
