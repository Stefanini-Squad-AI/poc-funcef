inherited frmCadAntec13: TfrmCadAntec13
  Left = 95
  Top = 184
  Caption = 'Registro e Histórico de Antecipações do Décimo Terceiro Salário'
  ClientHeight = 332
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    Height = 246
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 658
      Height = 34
      object Label1: TLabel
        Left = 7
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 162
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbtxtSituacao: TDBText
        Left = 568
        Top = 8
        Width = 78
        Height = 21
        Alignment = taCenter
        DataField = 'SITUACAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedMat: TwwDBEdit
        Left = 67
        Top = 7
        Width = 84
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 199
        Top = 7
        Width = 361
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 38
      Width = 658
      Height = 204
      Tabs.Strings = (
        'Linhas')
      inherited pgctrlDetalhe: TPageControl
        Width = 560
        Height = 145
        inherited tbsDet: TTabSheet
          Caption = 'Linhas'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 552
            Height = 117
            Selected.Strings = (
              'ANO'#9'10'#9'Ano de Referência'
              'MES'#9'10'#9'Mês de Referência'#9'F'
              'FLGOCORRIDA'#9'10'#9'Já Processada ?')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 552
            Height = 117
            object Label15: TLabel
              Left = 118
              Top = 44
              Width = 117
              Height = 13
              Caption = 'Mês da Antecipação'
            end
            object Label3: TLabel
              Left = 118
              Top = 7
              Width = 107
              Height = 13
              Caption = 'Ano de Referência'
            end
            object speAnoAntec: TwwDBSpinEdit
              Left = 256
              Top = 4
              Width = 62
              Height = 21
              Increment = 1
              DataField = 'ANO'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object speMesAntec: TwwDBSpinEdit
              Left = 256
              Top = 41
              Width = 62
              Height = 21
              Increment = 1
              DataField = 'MES'
              DataSource = dsDet
              MaxLength = 2
              TabOrder = 1
              UnboundDataType = wwDefault
              OnChange = speMesAntecChange
            end
            object dbrgProc: TDBRadioGroup
              Left = 116
              Top = 71
              Width = 324
              Height = 35
              Caption = 'Antecipação Já Processada ?'
              Columns = 2
              DataField = 'FLGOCORRIDA'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 2
              Values.Strings = (
                '1'
                '0')
              OnChange = dbrgProcChange
            end
            object edNomeMes: TEdit
              Left = 330
              Top = 42
              Width = 109
              Height = 21
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 650
      end
      inherited Dock974: TDock97
        Left = 564
        Height = 145
      end
    end
  end
  inherited Dock972: TDock97
    Width = 666
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 293
    Width = 666
    inherited tb97Fundo: TToolbar97
      Left = 497
      DockPos = 504
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 330
      DockPos = 337
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  F.IDPESSOA, F.MATRICULA,'
      '  ('#39'  '#39' || UPPER(PF.NOME)) AS NOME,'
      '  F.DATAADMISSAO, ST.TIPOSIT,'
      
        '  DECODE(ST.TIPOSIT,'#39'A'#39','#39'(Ativ'#39', '#39'F'#39','#39'(Afastad'#39', '#39'D'#39','#39'(Demitid'#39')' +
        ' ||'
      '    DECODE(PEFIS.SEXO,'#39'F'#39','#39'a)'#39','#39'o)'#39') AS SITUACAO'
      'FROM'
      '  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'
      'WHERE'
      '  (F.IDPESSOA  = :IDPESSOA)      AND'
      '  (F.IDPESSOA  = PEFIS.IDPESSOA) AND'
      '  (F.IDPESSOA  = PF.IDPESSOA)    AND'
      '  (F.IDSITFUNC = ST.IDSITFUNC(+))')
    Left = 279
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
    OnDataChange = dsDetDataChange
    Left = 583
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 251
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 
      'Seleciona Registro e Histórico de Antecipações do Décimo Terceir' +
      'o Salário'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDCARGO      = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA    = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    Left = 357
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 307
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryDetBeforeInsert
    AfterInsert = qryDetAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, ANO, MES, FLGOCORRIDA'
      'FROM'
      '  ANTECIP13'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '  ANO DESC, MES DESC')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGOCORRIDA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 546
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ANTECIP13'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  ANO = :ANO,'
      '  MES = :MES,'
      '  FLGOCORRIDA = :FLGOCORRIDA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  ANO = :OLD_ANO and'
      '  MES = :OLD_MES')
    InsertSQL.Strings = (
      'insert into ANTECIP13'
      '  (IDPESSOA, ANO, MES, FLGOCORRIDA)'
      'values'
      '  (:IDPESSOA, :ANO, :MES, :FLGOCORRIDA)')
    DeleteSQL.Strings = (
      'delete from ANTECIP13'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  ANO = :OLD_ANO and'
      '  MES = :OLD_MES')
    Left = 510
    Top = 3
  end
end
