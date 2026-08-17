inherited frmAcertoManualSimulacao: TfrmAcertoManualSimulacao
  Left = 50
  Top = 77
  Caption = 'Acerto Manual da Base de Simulação de Migração'
  ClientHeight = 441
  ClientWidth = 691
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 691
    Height = 402
    object GroupBox1: TGroupBox
      Left = 18
      Top = 12
      Width = 283
      Height = 70
      Caption = 'Indique o Mês / Ano Desejados'
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 21
        Width = 128
        Height = 13
        Caption = 'Mês / Ano ( mm/aaaa)'
      end
      object edMesAno: TMaskEdit
        Left = 12
        Top = 39
        Width = 128
        Height = 21
        EditMask = '!99/0000;1;_'
        MaxLength = 7
        TabOrder = 0
        Text = '  /    '
      end
      object bbtnBuscaDados: TBitBtn
        Left = 153
        Top = 15
        Width = 115
        Height = 49
        Caption = '&Buscar Dados'
        Default = True
        TabOrder = 1
        OnClick = bbtnBuscaDadosClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object dbgrdDados: TwwDBGrid
      Left = 18
      Top = 93
      Width = 661
      Height = 295
      Selected.Strings = (
        'MATRICULA'#9'13'#9'Matrícula'
        'SITUACAO'#9'2'#9'Cód. ~Situação'
        'NOME'#9'60'#9'Nome'
        'SEXO'#9'1'#9'Sexo'
        'ESTADOCIVIL'#9'1'#9'Est. Civil'
        'DATANASC'#9'18'#9'Data ~Nasc.'
        'DATAADMISSAO'#9'18'#9'Data ~Admissão'
        'INSCRICAODATA'#9'18'#9'Data ~Filiação'
        'REMUNERACAO'#9'10'#9'Remuneração'
        'SALPARTICIPACAO'#9'10'#9'Sal. ~Particip.'
        'CONTRIBUICAO'#9'10'#9'Contribuição'
        'TEMPOINSS'#9'10'#9'TCP'
        'TAXAJOIA'#9'10'#9'Taxa ~Jóia'
        'JOIA'#9'10'#9'Jóia'
        'PRAZOJOIAFALTA'#9'10'#9'Prazo Jóia ~Total'
        'PRAZOJOIAPAGO'#9'10'#9'Prazo Jóia ~Pago'
        'SRB'#9'10'#9'SRB'
        'PROPORCAO'#9'10'#9'Proporção'
        'DATAINICIOFUND'#9'18'#9'Data Início ~Benef'
        'VALORATUAL'#9'10'#9'Supl.~FCRT'
        'VLRINFINSS'#9'10'#9'INSS'
        'VALORABONO'#9'10'#9'Abono'
        'COTAPENSAO'#9'10'#9'Cota ~Pensão'
        'DATANASCVIT'#9'18'#9'Data Nasc. ~Vit. +Jovem'
        'DATANASCTEMP'#9'18'#9'Data Nasc. ~Temp. + Jovem'
        'NOMEBENEFICIO'#9'60'#9'Benefício'
        'NOMESITUACAO'#9'60'#9'Situação'
        'CAMPOOP1'#9'10'#9'Reserva ~Poupança'
        'CAMPOOP2'#9'10'#9'Reserva ~Matem.'
        'CAMPOOP3'#9'10'#9'Reserva ~Transf.'
        'RESERVARETIRADA'#9'10'#9'Reserva de ~Retirada'
        'CAMPOOP5'#9'10'#9'Reserva ~Matem. CEA'
        'CAMPOOP6'#9'10'#9'Reserva ~Transf. CEA'
        'CONTRIBUICAOEXTRA'#9'10'#9'Contrib~Extra'
        'IDADEAPOS'#9'10'#9'Idade na ~Aposentadoria')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsDados
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 691
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnGravar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gravar'
        TabOrder = 2
        OnClick = bbtnGravarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 16
    Top = 224
  end
  object dsDados: TwwDataSource
    DataSet = qryDados
    Left = 321
    Top = 12
  end
  object qryDados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM SIMULAMIGRACAO'
      'WHERE ANOMESREF = :ANOMESREF'
      'ORDER BY MATRICULA')
    UpdateObject = updDados
    ValidateWithMask = True
    Left = 375
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESREF'
        ParamType = ptUnknown
        Value = '2002/09'
      end>
  end
  object updDados: TUpdateSQL
    ModifySQL.Strings = (
      'update SIMULAMIGRACAO'
      'set'
      '  MATRICULA = :MATRICULA,'
      '  SITUACAO = :SITUACAO,'
      '  NOME = :NOME,'
      '  SEXO = :SEXO,'
      '  ESTADOCIVIL = :ESTADOCIVIL,'
      '  DATANASC = :DATANASC,'
      '  DATAADMISSAO = :DATAADMISSAO,'
      '  INSCRICAODATA = :INSCRICAODATA,'
      '  REMUNERACAO = :REMUNERACAO,'
      '  SALPARTICIPACAO = :SALPARTICIPACAO,'
      '  CONTRIBUICAO = :CONTRIBUICAO,'
      '  TEMPOINSS = :TEMPOINSS,'
      '  JOIA = :JOIA,'
      '  PRAZOJOIAFALTA = :PRAZOJOIAFALTA,'
      '  PRAZOJOIAPAGO = :PRAZOJOIAPAGO,'
      '  TAXAJOIA = :TAXAJOIA,'
      '  RPTRIBUTAVEL = :RPTRIBUTAVEL,'
      '  RPNAOTRIBUTAVEL = :RPNAOTRIBUTAVEL,'
      '  SRB = :SRB,'
      '  FATORPREVIDENC = :FATORPREVIDENC,'
      '  TEMPOMINCONTRIB = :TEMPOMINCONTRIB,'
      '  DATAINICIOFUND = :DATAINICIOFUND,'
      '  VALORATUAL = :VALORATUAL,'
      '  VLRINFINSS = :VLRINFINSS,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  VALORABONO = :VALORABONO,'
      '  DATAULTSIMULA = :DATAULTSIMULA,'
      '  OPCAO = :OPCAO,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATADEMISSAO = :DATADEMISSAO,'
      '  IDADEAPOS = :IDADEAPOS,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  COTAPENSAO = :COTAPENSAO,'
      '  DATANASCVIT = :DATANASCVIT,'
      '  DATANASCTEMP = :DATANASCTEMP,'
      '  NUMDEPEN = :NUMDEPEN,'
      '  NUMDEPENVIT = :NUMDEPENVIT,'
      '  NUMDEPENTEMP = :NUMDEPENTEMP,'
      '  PROPORCAO = :PROPORCAO,'
      '  NOMEBENEFICIO = :NOMEBENEFICIO,'
      '  NOMESITUACAO = :NOMESITUACAO,'
      '  CAMPOOP1 = :CAMPOOP1,'
      '  CAMPOOP2 = :CAMPOOP2,'
      '  CAMPOOP3 = :CAMPOOP3,'
      '  CAMPOOP4 = :CAMPOOP4,'
      '  CAMPO5 = :CAMPO5,'
      '  CAMPOOP5 = :CAMPOOP5,'
      '  RESERVARETIRADA = :RESERVARETIRADA,'
      '  CAMPOOP6 = :CAMPOOP6,'
      '  CONTRIBUICAOEXTRA = :CONTRIBUICAOEXTRA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  ANOMESREF = :OLD_ANOMESREF'
      ' ')
    InsertSQL.Strings = (
      'insert into SIMULAMIGRACAO'
      
        '  (IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, ANOMESREF, MAT' +
        'RICULA,'
      
        '   SITUACAO, NOME, SEXO, ESTADOCIVIL, DATANASC, DATAADMISSAO, IN' +
        'SCRICAODATA,'
      
        '   REMUNERACAO, SALPARTICIPACAO, CONTRIBUICAO, TEMPOINSS, JOIA, ' +
        'PRAZOJOIAFALTA,'
      
        '   PRAZOJOIAPAGO, TAXAJOIA, RPTRIBUTAVEL, RPNAOTRIBUTAVEL, SRB, ' +
        'FATORPREVIDENC,'
      
        '   TEMPOMINCONTRIB, DATAINICIOFUND, VALORATUAL, VLRINFINSS, IDBE' +
        'NEFICIO,'
      
        '   VALORABONO, DATAULTSIMULA, OPCAO, DATAMORTE, DATADEMISSAO, ID' +
        'ADEAPOS,'
      
        '   TRGDTINCLUSAO, TRGUSERINCLUSAO, COTAPENSAO, DATANASCVIT, DATA' +
        'NASCTEMP,'
      
        '   NUMDEPEN, NUMDEPENVIT, NUMDEPENTEMP, PROPORCAO, NOMEBENEFICIO' +
        ', NOMESITUACAO,'
      
        '   CAMPOOP1, CAMPOOP2, CAMPOOP3, CAMPOOP4, CAMPO5, CAMPOOP5, RES' +
        'ERVARETIRADA,'
      '   CAMPOOP6, CONTRIBUICAOEXTRA)'
      'values'
      
        '  (:IDPESSJUR, :IDPLANOPREV, :IDPESSOA, :SEQPROPOSTA, :ANOMESREF' +
        ', :MATRICULA,'
      
        '   :SITUACAO, :NOME, :SEXO, :ESTADOCIVIL, :DATANASC, :DATAADMISS' +
        'AO, :INSCRICAODATA,'
      
        '   :REMUNERACAO, :SALPARTICIPACAO, :CONTRIBUICAO, :TEMPOINSS, :J' +
        'OIA, :PRAZOJOIAFALTA,'
      
        '   :PRAZOJOIAPAGO, :TAXAJOIA, :RPTRIBUTAVEL, :RPNAOTRIBUTAVEL, :' +
        'SRB, :FATORPREVIDENC,'
      
        '   :TEMPOMINCONTRIB, :DATAINICIOFUND, :VALORATUAL, :VLRINFINSS, ' +
        ':IDBENEFICIO,'
      
        '   :VALORABONO, :DATAULTSIMULA, :OPCAO, :DATAMORTE, :DATADEMISSA' +
        'O, :IDADEAPOS,'
      
        '   :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :COTAPENSAO, :DATANASCVIT, ' +
        ':DATANASCTEMP,'
      
        '   :NUMDEPEN, :NUMDEPENVIT, :NUMDEPENTEMP, :PROPORCAO, :NOMEBENE' +
        'FICIO,'
      
        '   :NOMESITUACAO, :CAMPOOP1, :CAMPOOP2, :CAMPOOP3, :CAMPOOP4, :C' +
        'AMPO5,'
      '   :CAMPOOP5, :RESERVARETIRADA,'
      '   :CAMPOOP6, :CONTRIBUICAOEXTRA)'
      ' ')
    DeleteSQL.Strings = (
      'delete from SIMULAMIGRACAO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  ANOMESREF = :OLD_ANOMESREF')
    Left = 429
    Top = 12
  end
end
