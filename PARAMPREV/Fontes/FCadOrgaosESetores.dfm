inherited frmCadOrgaosESetores: TfrmCadOrgaosESetores
  Left = 113
  Top = 66
  HelpContext = 160129
  Caption = 'Cadastro de Órgãos (Locais) e Setores'
  ClientWidth = 594
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    inherited pnlMestre: TPanel
      Width = 592
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 98
        Align = alClient
        Caption = 'Órgão (Local)'
        TabOrder = 0
        object Label1: TLabel
          Left = 442
          Top = 51
          Width = 29
          Height = 13
          Caption = 'Sigla'
        end
        object Label2: TLabel
          Left = 9
          Top = 51
          Width = 89
          Height = 13
          Caption = 'Nome do Órgão'
        end
        object Label3: TLabel
          Left = 9
          Top = 15
          Width = 169
          Height = 13
          Caption = 'Filial à qual o Órgão pertence'
        end
        object dbedNomeLocal: TDBEdit
          Left = 9
          Top = 66
          Width = 418
          Height = 21
          DataField = 'NOME'
          DataSource = ds
          TabOrder = 0
        end
        object dbedSiglaLocal: TDBEdit
          Left = 442
          Top = 66
          Width = 117
          Height = 21
          DataField = 'SIGLA'
          DataSource = ds
          TabOrder = 1
        end
        object dblkpcmbFilial: TwwDBLookupCombo
          Left = 9
          Top = 29
          Width = 418
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Filial'
            'NUMFILIAL'#9'15'#9'Número'
            'SIGLA'#9'15'#9'Sigla'
            'FLGATIVO'#9'1'#9'Ativo')
          DataField = 'IDFILIALPESSOA'
          DataSource = ds
          LookupTable = qryFilial
          LookupField = 'IDFILIALPESSOA'
          Options = [loTitles]
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 592
      Tabs.Strings = (
        'Setores')
      inherited pgctrlDetalhe: TPageControl
        Width = 494
        inherited tbsDet: TTabSheet
          Caption = 'Setores do Órgão'
          inherited dbgrdDet: TwwDBGrid
            Width = 486
            Selected.Strings = (
              'SIGLA'#9'15'#9'Sigla'
              'NOME'#9'40'#9'Nome do Setor')
          end
          inherited pnlControlesDet: TPanel
            Width = 486
            BevelOuter = bvLowered
            object Label5: TLabel
              Left = 6
              Top = 12
              Width = 85
              Height = 13
              Caption = 'Nome do Setor'
            end
            object Label4: TLabel
              Left = 357
              Top = 12
              Width = 29
              Height = 13
              Caption = 'Sigla'
            end
            object dbedNomeSetor: TDBEdit
              Left = 6
              Top = 27
              Width = 346
              Height = 21
              DataField = 'NOME'
              DataSource = dsDet
              TabOrder = 0
            end
            object dbedSiglaSetor: TDBEdit
              Left = 357
              Top = 27
              Width = 121
              Height = 21
              DataField = 'SIGLA'
              DataSource = dsDet
              TabOrder = 1
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 584
      end
      inherited Dock974: TDock97
        Left = 498
      end
    end
  end
  inherited Dock972: TDock97
    Width = 594
  end
  inherited Dock971: TDock97
    Width = 594
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 476
    Top = 4
  end
  inherited ds: TwwDataSource
    Left = 262
    Top = 65535
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LOCALPREV'
      'set'
      '  IDLOCAL = :IDLOCAL,'
      '  IDFILIALPESSOA = :IDFILIALPESSOA,'
      '  SIGLA = :SIGLA,'
      '  NOME = :NOME'
      'where'
      '  IDLOCAL = :OLD_IDLOCAL and'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    InsertSQL.Strings = (
      'insert into LOCALPREV'
      '  (IDLOCAL, IDFILIALPESSOA, SIGLA, NOME)'
      'values'
      '  (:IDLOCAL, :IDFILIALPESSOA, :SIGLA, :NOME)')
    DeleteSQL.Strings = (
      'delete from LOCALPREV'
      'where'
      '  IDLOCAL = :OLD_IDLOCAL and'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    Left = 302
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Órgão'
    Colunas.Strings = (
      'L.SIGLA'
      'L.NOME'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Órgão'
      'Filial')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'LOCALPREV L'
      'PESSOA P')
    CamposChave.Strings = (
      'P.IDGRUPO'
      'L.IDLOCAL')
    Filtro.Strings = (
      'L.IDFILIALPESSOA = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '40'
      '40')
    Left = 393
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT L.IDLOCAL, L.IDFILIALPESSOA, L.SIGLA, L.NOME'
      'FROM   LOCALPREV L, PESSOA P'
      'WHERE  L.IDLOCAL = :IDLOCAL'
      'AND    P.IDGRUPO = :IDGRUPO'
      'AND    L.IDFILIALPESSOA = P.IDPESSOA')
    Left = 336
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryFilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT F.IDFILIALPESSOA,F.SIGLA, F.NUMFILIAL, F.FLGATIVO, P.NOME'
      'FROM   FILIALPESSOA F, PESSOA P'
      'WHERE  F.IDFILIALPESSOA = P.IDPESSOA'
      'AND    P.IDGRUPO = :IDGRUPO'
      ''
      ' ')
    ControlType.Strings = (
      'FLGATIVO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 435
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end>
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSJUR, SIGLA, NOME'
      'FROM ORGAOPREV'
      'WHERE IDPESSJUR =:IDPESSJUR')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 514
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ORGAOPREV'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  SIGLA = :SIGLA,'
      '  NOME = :NOME'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SIGLA = :OLD_SIGLA')
    InsertSQL.Strings = (
      'insert into ORGAOPREV'
      '  (IDPESSJUR, SIGLA, NOME)'
      'values'
      '  (:IDPESSJUR, :SIGLA, :NOME)')
    DeleteSQL.Strings = (
      'delete from ORGAOPREV'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  SIGLA = :OLD_SIGLA')
    Left = 556
    Top = 5
  end
end
