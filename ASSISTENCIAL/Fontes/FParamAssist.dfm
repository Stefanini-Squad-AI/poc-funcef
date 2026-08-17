inherited FrmParamAssist: TFrmParamAssist
  Left = 152
  Top = 114
  Caption = 'Parâmetros do Sistema Assistencial'
  ClientHeight = 435
  ClientWidth = 753
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 753
    Height = 349
    object pgctrlParam: TPageControl
      Left = 1
      Top = 1
      Width = 751
      Height = 347
      ActivePage = tbsGeral
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Gerais'
        object pnlGerais: TPanel
          Left = 0
          Top = 0
          Width = 743
          Height = 319
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 741
            Height = 114
            Align = alTop
            TabOrder = 0
            object GroupBox3: TGroupBox
              Left = 1
              Top = 1
              Width = 739
              Height = 109
              Align = alTop
              Caption = 'Integração'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object chFLGINTCONTBASS: TDBCheckBox
                Left = 12
                Top = 22
                Width = 203
                Height = 17
                Caption = 'Integrado com Contabilidade'
                DataField = 'FLGINTCONTAB'
                DataSource = ds
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object chFLGINTCPAGAR: TDBCheckBox
                Left = 12
                Top = 46
                Width = 205
                Height = 17
                Caption = 'Integrado com Contas a Pagar'
                DataField = 'FLGINTCPAGAR'
                DataSource = ds
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object chFLGINTCRECEBER: TDBCheckBox
                Left = 12
                Top = 70
                Width = 211
                Height = 17
                Caption = 'Integrado com Contas a Receber'
                DataField = 'FLGINTCRECEBER'
                DataSource = ds
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
          object Panel2: TPanel
            Left = 1
            Top = 210
            Width = 741
            Height = 108
            Align = alBottom
            TabOrder = 2
            object GroupBox1: TGroupBox
              Left = 1
              Top = 1
              Width = 366
              Height = 106
              Align = alClient
              Caption = '  Contribuições  '
              TabOrder = 0
              object Label2: TLabel
                Left = 27
                Top = 38
                Width = 308
                Height = 13
                Caption = '(quando participante é incluído no Plano Assistencial)'
              end
              object chFLGCOBPRIMBCOASS: TDBCheckBox
                Left = 9
                Top = 16
                Width = 325
                Height = 24
                Caption = 'Primeira contribuição deve ser cobrada em banco'
                DataField = 'FLGCOBPRIMBCO'
                DataSource = ds
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbChPrePag: TDBCheckBox
                Left = 9
                Top = 54
                Width = 345
                Height = 17
                Caption = 'Contribuição será cobrada antes do mês de referência.'
                DataField = 'FLGPREPAG'
                DataSource = ds
                TabOrder = 1
                ValueChecked = 'True'
                ValueUnchecked = 'False'
              end
              object DBCheckBox1: TDBCheckBox
                Left = 9
                Top = 80
                Width = 345
                Height = 17
                Caption = 'Gera rubrica automaticamente para novas contribuições'
                DataField = 'FLGRUBRICAAUTO'
                DataSource = ds
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object GroupBox2: TGroupBox
              Left = 367
              Top = 1
              Width = 373
              Height = 106
              Align = alRight
              Caption = ' Associação de Regras do Assistencial '
              TabOrder = 1
              object Label3: TLabel
                Left = 8
                Top = 16
                Width = 212
                Height = 13
                Caption = 'Tipo de regra do sistema Assistencial'
              end
              object Label4: TLabel
                Left = 8
                Top = 64
                Width = 227
                Height = 13
                Caption = 'Grupo de regras do sistema Assistencial'
              end
              object wwDBLookupCombo1: TwwDBLookupCombo
                Left = 8
                Top = 34
                Width = 336
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCREGRA'#9'60'#9'Nome do Tipo de Regra'#9'F')
                DataField = 'IDTIPOREGRA'
                DataSource = ds
                LookupTable = qryTipoRegra
                LookupField = 'IDTIPOREGRA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
              object wwDBLookupCombo2: TwwDBLookupCombo
                Left = 8
                Top = 79
                Width = 336
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Nome do Grupo de Regras'#9'F')
                DataField = 'IDGRUPOREGRA'
                DataSource = ds
                LookupTable = qryGrupoRegra
                LookupField = 'IDGRUPOREGRA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
          object GroupBox4: TGroupBox
            Left = 1
            Top = 115
            Width = 741
            Height = 95
            Align = alClient
            Caption = '  Contas a Pagar  '
            TabOrder = 1
            object dbckFlgUsaCentCusto: TDBCheckBox
              Left = 8
              Top = 16
              Width = 193
              Height = 17
              Caption = 'Sistema usa Centro de Custo'
              DataField = 'FLGUSACENTCUST'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object pnlCentroCusto: TPanel
              Left = 2
              Top = 29
              Width = 737
              Height = 64
              Align = alBottom
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 1
              object GroupBox8: TGroupBox
                Left = 5
                Top = 9
                Width = 350
                Height = 47
                Caption = 'Programa'
                TabOrder = 0
                object dblkPrograma: TwwDBLookupCombo
                  Left = 8
                  Top = 18
                  Width = 336
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCPROGRAMA'#9'60'#9'Descrição'#9'F')
                  DataField = 'CODPROGRAMA'
                  DataSource = ds
                  LookupTable = qryPrograma
                  LookupField = 'CODPROGRAMA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object GroupBox12: TGroupBox
                Left = 377
                Top = 9
                Width = 350
                Height = 47
                Caption = 'Centro de Custo'
                TabOrder = 1
                object dblkCentroCusto: TwwDBLookupCombo
                  Left = 8
                  Top = 18
                  Width = 336
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Descrição'#9'F')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = ds
                  LookupTable = qryCentroCusto
                  LookupField = 'CODCENTROCUSTO'
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
            end
          end
        end
      end
      object tbsMotivos: TTabSheet
        Caption = 'Motivos'
        object pnlMotivos: TPanel
          Left = 0
          Top = 0
          Width = 743
          Height = 319
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'pnlMotivos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object ScrollBox1: TScrollBox
            Left = 1
            Top = 1
            Width = 741
            Height = 317
            HorzScrollBar.Tracking = True
            Align = alClient
            TabOrder = 0
            object Label10: TLabel
              Left = 36
              Top = 33
              Width = 231
              Height = 13
              Caption = 'Cobrança de Contribuições Assistenciais'
            end
            object Label14: TLabel
              Left = 36
              Top = 255
              Width = 140
              Height = 13
              Caption = 'Comissão de Fornecedor'
            end
            object Label15: TLabel
              Left = 36
              Top = 212
              Width = 150
              Height = 13
              Caption = 'Pagamento de Fornecedor'
            end
            object Label34: TLabel
              Left = 36
              Top = 74
              Width = 115
              Height = 13
              Caption = 'Cobrança em Atraso'
            end
            object Label35: TLabel
              Left = 36
              Top = 159
              Width = 78
              Height = 13
              Caption = 'Parcelamento'
            end
            object Label36: TLabel
              Left = 36
              Top = 116
              Width = 211
              Height = 13
              Caption = 'Cálculo de Pagamento de Devolução'
            end
            object Label1: TLabel
              Left = 12
              Top = 9
              Width = 161
              Height = 20
              Caption = 'Motivo Padrão para:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cmbmotivocontribass: TwwDBLookupCombo
              Left = 36
              Top = 48
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOCONTRIBA'
              DataSource = ds
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo5: TwwDBLookupCombo
              Left = 36
              Top = 227
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOFORNPAG'
              DataSource = ds
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo6: TwwDBLookupCombo
              Left = 36
              Top = 270
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOFORNCOMI'
              DataSource = ds
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbmotivoatrasoas: TwwDBLookupCombo
              Left = 36
              Top = 89
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOATRASOAS'
              DataSource = ds
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbmotivodevolas: TwwDBLookupCombo
              Left = 36
              Top = 132
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVODEVOLAS'
              DataSource = ds
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbmotivofinancas: TwwDBLookupCombo
              Left = 36
              Top = 175
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOFINANCAS'
              DataSource = ds
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              Enabled = False
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 753
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 753
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 65534
  end
  inherited ds: TwwDataSource
    Left = 405
    Top = 65534
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMASSIST'
      'set'
      '  IDTIPOREGRA = :IDTIPOREGRA,'
      '  IDGRUPOREGRA = :IDGRUPOREGRA,'
      '  PLARECUPDESPEXANT = :PLARECUPDESPEXANT,'
      '  PLANO = :PLANO,'
      '  PLARECUPRECEXANT = :PLARECUPRECEXANT,'
      '  TPDOCPENVIOBANCO = :TPDOCPENVIOBANCO,'
      '  TIPOPERENVIO = :TIPOPERENVIO,'
      '  TIPOPERCOBRANCA = :TIPOPERCOBRANCA,'
      '  TIPOPERDIVERG = :TIPOPERDIVERG,'
      '  TPDOCPENVIOPATRO = :TPDOCPENVIOPATRO,'
      '  TPDOCRRECPATRO = :TPDOCRRECPATRO,'
      '  TPDOCRRECBANCO = :TPDOCRRECBANCO,'
      '  FLGPREPAG = :FLGPREPAG,'
      '  FLGUSACENTCUST = :FLGUSACENTCUST,'
      '  CODPROGRAMA = :CODPROGRAMA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDMOTIVOFORNCOMI = :IDMOTIVOFORNCOMI,'
      '  IDMOTIVOFORNPAG = :IDMOTIVOFORNPAG,'
      '  IDMOTIVOCONTRIBA = :IDMOTIVOCONTRIBA,'
      '  IDMOTIVOATRASOAS = :IDMOTIVOATRASOAS,'
      '  IDMOTIVODEVOLAS = :IDMOTIVODEVOLAS,'
      '  IDMOTIVOFINANCAS = :IDMOTIVOFINANCAS,'
      '  FLGINTCONTAB = :FLGINTCONTAB,'
      '  FLGINTCRECEBER = :FLGINTCRECEBER,'
      '  FLGINTCPAGAR = :FLGINTCPAGAR,'
      '  FLGCOBPRIMBCO = :FLGCOBPRIMBCO,'
      '  FLGRUBRICAAUTO = :FLGRUBRICAAUTO,'
      '  IDSITCANCELPREV = :IDSITCANCELPREV,'
      '  IDSITCANCELDESIST = :IDSITCANCELDESIST,'
      '  IDSITCANCELMORTE = :IDSITCANCELMORTE'
      'where'
      '  TRGUSERINCLUSAO = :OLD_TRGUSERINCLUSAO and'
      '  TRGDTINCLUSAO = :OLD_TRGDTINCLUSAO')
    InsertSQL.Strings = (
      'insert into PARAMASSIST'
      '  (IDTIPOREGRA, IDGRUPOREGRA, PLARECUPDESPEXANT, PLANO, '
      'PLARECUPRECEXANT, '
      '   TPDOCPENVIOBANCO, TIPOPERENVIO, TIPOPERCOBRANCA, '
      'TIPOPERDIVERG, TPDOCPENVIOPATRO, '
      '   TPDOCRRECPATRO, TPDOCRRECBANCO, FLGPREPAG, FLGUSACENTCUST, '
      'CODPROGRAMA, '
      '   CODCENTROCUSTO, IDMOTIVOFORNCOMI, IDMOTIVOFORNPAG, '
      'IDMOTIVOCONTRIBA, '
      '   IDMOTIVOATRASOAS, IDMOTIVODEVOLAS, IDMOTIVOFINANCAS, '
      'FLGINTCONTAB, FLGINTCRECEBER, '
      
        '   FLGINTCPAGAR, FLGCOBPRIMBCO, FLGRUBRICAAUTO, IDSITCANCELPREV,' +
        ' '
      'IDSITCANCELDESIST, '
      '   IDSITCANCELMORTE)'
      'values'
      '  (:IDTIPOREGRA, :IDGRUPOREGRA, :PLARECUPDESPEXANT, :PLANO, '
      ':PLARECUPRECEXANT, '
      '   :TPDOCPENVIOBANCO, :TIPOPERENVIO, :TIPOPERCOBRANCA, '
      ':TIPOPERDIVERG, '
      '   :TPDOCPENVIOPATRO, :TPDOCRRECPATRO, :TPDOCRRECBANCO, '
      ':FLGPREPAG, :FLGUSACENTCUST, '
      '   :CODPROGRAMA, :CODCENTROCUSTO, :IDMOTIVOFORNCOMI, '
      ':IDMOTIVOFORNPAG, '
      '   :IDMOTIVOCONTRIBA, :IDMOTIVOATRASOAS, :IDMOTIVODEVOLAS, '
      ':IDMOTIVOFINANCAS, '
      
        '   :FLGINTCONTAB, :FLGINTCRECEBER, :FLGINTCPAGAR, :FLGCOBPRIMBCO' +
        ', '
      ':FLGRUBRICAAUTO, '
      '   :IDSITCANCELPREV, :IDSITCANCELDESIST, :IDSITCANCELMORTE)')
    DeleteSQL.Strings = (
      'delete from PARAMASSIST'
      'where'
      '  TRGUSERINCLUSAO = :OLD_TRGUSERINCLUSAO and'
      '  TRGDTINCLUSAO = :OLD_TRGDTINCLUSAO')
    Left = 455
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Left = 555
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 306
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 505
    Top = 65534
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDTIPOREGRA,       IDGRUPOREGRA,      PLARECUPDESPEXANT,'
      '       PLANO,             PLARECUPRECEXANT,  TPDOCPENVIOBANCO,'
      '       TIPOPERENVIO,      TIPOPERCOBRANCA,   TIPOPERDIVERG,'
      '       TPDOCPENVIOPATRO,  TPDOCRRECPATRO,    TPDOCRRECBANCO,'
      '       FLGPREPAG,         FLGUSACENTCUST,    CODPROGRAMA,'
      '       CODCENTROCUSTO,    IDMOTIVOFORNCOMI,  IDMOTIVOFORNPAG,'
      '       IDMOTIVOCONTRIBA,  IDMOTIVOATRASOAS,  IDMOTIVODEVOLAS,'
      '       IDMOTIVOFINANCAS,  FLGINTCONTAB,      FLGINTCRECEBER,'
      '       FLGINTCPAGAR,      FLGCOBPRIMBCO,     FLGRUBRICAAUTO,'
      '       IDSITCANCELPREV,   IDSITCANCELDESIST, IDSITCANCELMORTE, '
      '       TRGUSERINCLUSAO,   TRGDTINCLUSAO'
      'FROM PARAMASSIST'
      ' '
      ' ')
    Left = 356
    Top = 65534
  end
  object qryTipoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOREGRA, UPPER(DESCREGRA) DESCREGRA'
      'FROM TIPOREGRA'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 704
    Top = 65534
  end
  object qryGrupoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPOREGRA, UPPER(DESCRICAO) DESCRICAO'
      'FROM GRUPOREGRA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 654
    Top = 65534
  end
  object qryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDPROGRAMA,'
      '      CODPROGRAMA,'
      '      DESCPROGRAMA'
      'FROM   PROGRAMA'
      'ORDER BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 604
    Top = 65534
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME||'#39' - '#39'||CODEXTERNO  as NOME'
      'FROM CENTCUST'
      'WHERE'
      '     (IDEMPRESA = :IEMPRESA)'
      
        '     AND (IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOB' +
        'AL))'
      '     AND (ATIVO = '#39'S'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 74
    Top = 387
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 134
    Top = 387
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDMOTIVO, UPPER(DESCRICAO) DESCRICAO'
      'FROM     MOTIVO'
      'WHERE FLGTIPO = '#39'A'#39
      'ORDER BY UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 14
    Top = 387
  end
  object qrySitCancel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOASS, DESCRICAO'
      'FROM SITPLANOASS'
      'WHERE FLGINTERNO = '#39'CA'#39' ')
    ValidateWithMask = True
    Left = 704
    Top = 136
  end
end
