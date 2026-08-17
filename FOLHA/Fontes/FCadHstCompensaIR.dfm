inherited FrmCadHstCompensaIR: TFrmCadHstCompensaIR
  Left = 52
  Top = 83
  Caption = 'Cadastro de Compensação Judicial de IRRF'
  ClientHeight = 438
  ClientWidth = 673
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 673
    Height = 352
    inherited pnlMestre: TPanel
      Width = 663
      Height = 108
      object lbNome: TLabel
        Left = 10
        Top = 5
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object lbMatricula: TLabel
        Left = 308
        Top = 5
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lbCPF: TLabel
        Left = 416
        Top = 5
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object lbSitNaFund: TLabel
        Left = 524
        Top = 5
        Width = 80
        Height = 13
        Caption = 'Sit. Fundação'
      end
      object lbCompTotal: TLabel
        Left = 360
        Top = 56
        Width = 107
        Height = 13
        Caption = 'Total a Compensar'
      end
      object lbSaldo: TLabel
        Left = 512
        Top = 56
        Width = 119
        Height = 13
        Caption = 'Total já compensado'
      end
      object edSitNaFund: TEdit
        Left = 524
        Top = 17
        Width = 129
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
      object dbedNome: TDBEdit
        Left = 10
        Top = 17
        Width = 287
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = dsPart
        ReadOnly = True
        TabOrder = 1
      end
      object dbedMatric: TDBEdit
        Left = 308
        Top = 17
        Width = 98
        Height = 21
        Color = clSilver
        DataField = 'MATRICULA'
        DataSource = dsPart
        ReadOnly = True
        TabOrder = 2
      end
      object dbedCPF: TDBEdit
        Left = 416
        Top = 17
        Width = 98
        Height = 21
        Color = clSilver
        DataField = 'NUMDOCUMENTO'
        DataSource = dsPart
        ReadOnly = True
        TabOrder = 3
      end
      object gbAnoMesInicio: TGroupBox
        Left = 10
        Top = 44
        Width = 159
        Height = 54
        Caption = 'Início da Compensação'
        TabOrder = 4
        object lbAnoInicio: TLabel
          Left = 9
          Top = 13
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object lbMesInicio: TLabel
          Left = 104
          Top = 13
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object lbBarraAnoMesInicio: TLabel
          Left = 93
          Top = 26
          Width = 6
          Height = 20
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edAnoInicio: TEdit
          Left = 9
          Top = 26
          Width = 81
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
        object edMesInicio: TEdit
          Left = 103
          Top = 26
          Width = 42
          Height = 21
          MaxLength = 2
          TabOrder = 1
        end
      end
      object gbAnoMesFinal: TGroupBox
        Left = 176
        Top = 44
        Width = 161
        Height = 54
        Caption = 'Final da Compensação'
        TabOrder = 5
        object lbBarraAnoMesFim: TLabel
          Left = 95
          Top = 26
          Width = 6
          Height = 20
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbAnoFim: TLabel
          Left = 10
          Top = 13
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object lbMesFim: TLabel
          Left = 104
          Top = 13
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object edAnoFim: TEdit
          Left = 10
          Top = 26
          Width = 81
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
        object edMesFim: TEdit
          Left = 104
          Top = 26
          Width = 42
          Height = 21
          MaxLength = 2
          TabOrder = 1
        end
      end
      object edCompTotal: TDBEdit
        Left = 360
        Top = 70
        Width = 131
        Height = 21
        DataField = 'COMPTOTAL'
        DataSource = ds
        TabOrder = 6
      end
      object edSaldo: TDBEdit
        Left = 512
        Top = 70
        Width = 121
        Height = 21
        DataField = 'SALDOCOMP'
        DataSource = ds
        TabOrder = 7
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 113
      Width = 663
      Height = 234
      inherited pgctrlDetalhe: TPageControl
        Width = 565
        Height = 175
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 557
            Height = 147
            object lbValComp: TLabel
              Left = 10
              Top = 82
              Width = 106
              Height = 13
              Caption = 'Valor Compensado'
            end
            object lbValDevidoMes: TLabel
              Left = 176
              Top = 82
              Width = 74
              Height = 13
              Caption = 'Valor Devido'
            end
            object gbAnoMesDesc: TGroupBox
              Left = 10
              Top = 8
              Width = 159
              Height = 55
              Caption = 'Mês de Desconto de IR'
              TabOrder = 0
              object lbAnoDesc: TLabel
                Left = 9
                Top = 14
                Width = 23
                Height = 13
                Caption = 'Ano'
              end
              object lbBarraDesc: TLabel
                Left = 93
                Top = 27
                Width = 6
                Height = 20
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbMesDesc: TLabel
                Left = 104
                Top = 14
                Width = 24
                Height = 13
                Caption = 'Mês'
              end
              object edAnoDesc: TEdit
                Left = 9
                Top = 27
                Width = 81
                Height = 21
                MaxLength = 4
                TabOrder = 0
              end
              object edMesDesc: TEdit
                Left = 103
                Top = 27
                Width = 42
                Height = 21
                MaxLength = 2
                TabOrder = 1
              end
            end
            object gbVersao: TGroupBox
              Left = 176
              Top = 8
              Width = 361
              Height = 55
              Caption = 'Versão'
              TabOrder = 1
              object dblkVersao: TwwDBLookupCombo
                Left = 10
                Top = 26
                Width = 338
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Versão'#9'F')
                LookupTable = qryHistorico
                LookupField = 'IDHSTFOLHABENEF'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
            object edValComp: TDBEdit
              Left = 10
              Top = 96
              Width = 121
              Height = 21
              DataField = 'VLRCOMPMES'
              DataSource = dsDet
              TabOrder = 2
            end
            object edValDevido: TDBEdit
              Left = 176
              Top = 96
              Width = 121
              Height = 21
              DataField = 'VLRDEVIDOMES'
              DataSource = dsDet
              TabOrder = 3
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 557
            Height = 147
            Selected.Strings = (
              'MESREF'#9'7'#9'Mês Ref.'#9'F'
              'HISTORICO'#9'35'#9'Versão'#9'F'
              'VLRCOMPMES'#9'10'#9'Valor Compensado'#9'F'
              'VLRDEVIDOMES'#9'10'#9'Valor Devido'#9'F')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 655
      end
      inherited Dock974: TDock97
        Left = 569
        Height = 175
      end
    end
  end
  inherited Dock972: TDock97
    Width = 673
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 673
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      '  *'
      ''
      'FROM'
      '  CM.COMPENSAIRRF'
      ''
      'WHERE'
      '  IDPESSOA = :IDPESSOA    ')
    Left = 265
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 635
    Top = 394
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 390
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.COMPENSAIRRF'
      'set'
      '  IDCOMPIRRF = :IDCOMPIRRF,'
      '  IDPESSOA = :IDPESSOA,'
      '  ANOMESINICIO = :ANOMESINICIO,'
      '  ANOMESFIM = :ANOMESFIM,'
      '  COMPTOTAL = :COMPTOTAL,'
      '  SALDOCOMP = :SALDOCOMP'
      'where'
      '  IDCOMPIRRF = :OLD_IDCOMPIRRF and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CM.COMPENSAIRRF'
      
        '  (IDCOMPIRRF, IDPESSOA, ANOMESINICIO, ANOMESFIM, COMPTOTAL, SAL' +
        'DOCOMP)'
      'values'
      
        '  (:IDCOMPIRRF, :IDPESSOA, :ANOMESINICIO, :ANOMESFIM, :COMPTOTAL' +
        ', :SALDOCOMP)')
    DeleteSQL.Strings = (
      'delete from CM.COMPENSAIRRF'
      'where'
      '  IDCOMPIRRF = :OLD_IDCOMPIRRF and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 306
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mat. do Titular'
      'Mat. do Dependente'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '18'
      '60')
    Left = 387
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 346
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Top = 406
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 508
    Top = 2
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 476
    Top = 394
  end
  object qryPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA,'
      '  D.IDTITULAR,'
      '  P.NUMDOCUMENTO,'
      '  P.NOME,'
      '  D.MATRICULA'
      ''
      'FROM'
      '  PESSOA P,'
      '  DEPENTIT D'
      ''
      'WHERE'
      '  D.IDPESSOA = :IDPESSOA  AND'
      '  D.IDPESSOA = P.IDPESSOA')
    ValidateWithMask = True
    Left = 445
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsPart: TwwDataSource
    DataSet = qryPart
    Left = 557
    Top = 4
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39#39' - '#39#39'||HISTORICO AS NOME'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 605
    Top = 121
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDHSTCOMPIRRF,'
      '  C.IDPESSOA,'
      '  C.MESREF,'
      '  C.IDHSTFOLHABENEF,'
      '  F.HISTORICO,'
      '  C.VLRCOMPMES,'
      '  C.VLRDEVIDOMES'
      ''
      'FROM'
      '  CM.HSTCOMPENSAIRRF C,'
      '  HSTFOLHABENEF F'
      ''
      'WHERE'
      '  C.IDPESSOA        = :IDPESSOA AND'
      '  C.IDHSTFOLHABENEF = F.IDHSTFOLHABENEF'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 585
    Top = 393
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.HSTCOMPENSAIRRF'
      'set'
      '  IDHSTCOMPIRRF = :IDHSTCOMPIRRF,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDHSTFOLHABENEF = :IDHSTFOLHABENEF,'
      '  VLRCOMPMES = :VLRCOMPMES,'
      '  VLRDEVIDOMES = :VLRDEVIDOMES,'
      '  MESREF = :MESREF'
      'where'
      '  IDHSTCOMPIRRF = :OLD_IDHSTCOMPIRRF and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CM.HSTCOMPENSAIRRF'
      
        '  (IDHSTCOMPIRRF, IDPESSOA, IDHSTFOLHABENEF, VLRCOMPMES, VLRDEVI' +
        'DOMES, '
      '   MESREF)'
      'values'
      
        '  (:IDHSTCOMPIRRF, :IDPESSOA, :IDHSTFOLHABENEF, :VLRCOMPMES, :VL' +
        'RDEVIDOMES, '
      '   :MESREF)')
    DeleteSQL.Strings = (
      'delete from CM.HSTCOMPENSAIRRF'
      'where'
      '  IDHSTCOMPIRRF = :OLD_IDHSTCOMPIRRF and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 539
    Top = 393
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 605
    Top = 63
  end
  object qryAuxDet: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 610
    Top = 1
  end
end
