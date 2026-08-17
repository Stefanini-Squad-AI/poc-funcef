{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
unit FGeraArqSERPROS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Usistema;

type
  TfrmGeraArqSERPROS = class(TfrmOkCancelar)
    memExplicacao: TMemo;
    qry: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraArqSERPROS: TfrmGeraArqSERPROS;

implementation

uses UFuncoesUteis, UAdmPrev, fAguarde, UMensErro;

{$R *.DFM}

procedure TfrmGeraArqSERPROS.bbtnConfirmarClick(Sender: TObject);
var F      : TextFile;
    sSQL,
    sLinha : string;
begin
  inherited;

  // 1. Arquivo de Salário de Participação = CM_ARQSALPART.TXT
  frmAguarde.Mostra('Gerando Arquivo de Salários ...');
  //Henrique Massão
  //AssignFile(F, 'C:\CM_ARQSALPART.TXT');
  AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CM_ARQSALPART.TXT ');

  Rewrite(F);

  sSQL := ' SELECT ''001'' AS CODFUNDO, DECODE(HST.IDPESSJUR, 1, ''002'', '+
          '                                                  99, ''001'', '+
          '                                                      ''XXX'') AS CODPATRO, '+
          '        PP.INSCRICAONUMERO,                            '+
          '        HST.MES AS MESREFERENCIA,                      '+
          '        HST.VALORPROVENTO                              '+
          ' FROM   PARTPREVPLAN PP, HISTRUBSAL HST                '+
          ' WHERE  PP.IDPLANOPREV = 12                            '+
          ' AND    HST.IDPESSJUR  = PP.IDPESSJUR                  '+
          ' AND    HST.IDPESSOA   = PP.IDPESSOA                   '+
          ' AND    HST.IDRUBRICA  = 166                           '+
          ' ORDER BY HST.MES, PP.INSCRICAONUMERO                  ';
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;

     while not Eof do
     begin
        sLinha := '';
        sLinha :=          FieldByName('CODFUNDO').AsString;
        sLinha := sLinha + FieldByName('CODPATRO').AsString;
        sLinha := sLinha + PreparaStr(FieldByName('INSCRICAONUMERO').AsString, 9);
        sLinha := sLinha + PreparaStr( Copy(FieldByName('MESREFERENCIA').AsString,1,4)+Copy(FieldByName('MESREFERENCIA').AsString,6,2),   6);
        sLinha := sLinha + ColocaZeros( FloatToStr(FieldByName('VALORPROVENTO').AsFloat * 100), 12);
        writeln(F, sLinha);
        Next;
     end;
  end;
  CloseFile(F);
  frmAguarde.Apaga;

  // 2. Arquivo de Participante no Plano = CM_PARTICIPANTE.TXT
  frmAguarde.Mostra('Gerando Arquivo de Participantes ...');
  //Henrique Massão
  //AssignFile(F, 'C:\CM_PARTICIPANTE.TXT');
  AssignFile(F,Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CM_PARTICIPANTE.TXT ');

  Rewrite(F);

  sSQL := ' SELECT ''001'' AS CODFUNDO, DECODE(PP.IDPESSJUR, 1, ''002'',    '+
          '                                                 99, ''001'',    '+
          '                                                     ''XXX'') AS CODPATRO, '+
          '         PP.INSCRICAONUMERO,                                     '+
          '         PP.DTINICIOINSC,                                        '+
          '         CPFACUL.VALORBASE1 AS PERCFACUL,                        '+
          '         CPESP.VALORBASE1   AS VALORESP,                         '+
          '         CPBASICA.VALORBASE1 AS PERCBASICA,                      '+
          '         DECODE(PP.IDSITPART, 9, 1, 0) AS SITPLA,                '+
          '         PP.DATACANCELAMENTO                                     '+
          ' FROM   PARTPREVPLAN PP , CONTRIBPREVPARTP CPESP, CONTRIBPREVPARTP CPFACUL, CONTRIBPREVPARTP CPBASICA '+
          ' WHERE  PP.IDPLANOPREV          = 12                             '+
          ' AND    CPESP.IDPESSJUR         = PP.IDPESSJUR                   '+
          ' AND    CPESP.IDPLANOPREV       = PP.IDPLANOPREV                 '+
          ' AND    CPESP.IDPESSOA          = PP.IDPESSOA                    '+
          ' AND    CPESP.SEQPROPOSTA       = PP.SEQPROPOSTA                 '+
          ' AND    CPESP.IDCONTRIBUICAO    = 22                             '+
          ' AND    CPFACUL.IDPESSJUR       = PP.IDPESSJUR                   '+
          ' AND    CPFACUL.IDPLANOPREV     = PP.IDPLANOPREV                 '+
          ' AND    CPFACUL.IDPESSOA        = PP.IDPESSOA                    '+
          ' AND    CPFACUL.SEQPROPOSTA     = PP.SEQPROPOSTA                 '+
          ' AND    CPFACUL.IDCONTRIBUICAO  = 19                             '+
          ' AND    CPBASICA.IDPESSJUR      = PP.IDPESSJUR                   '+
          ' AND    CPBASICA.IDPLANOPREV    = PP.IDPLANOPREV                 '+
          ' AND    CPBASICA.IDPESSOA       = PP.IDPESSOA                    '+
          ' AND    CPBASICA.SEQPROPOSTA    = PP.SEQPROPOSTA                 '+
          ' AND    CPBASICA.IDCONTRIBUICAO = 21                             '+
          ' ORDER BY PP.INSCRICAONUMERO                                     ';

  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;

     while not Eof do
     begin
        sLinha := '';
        sLinha :=          FieldByName('CODFUNDO').AsString;
        sLinha := sLinha + FieldByName('CODPATRO').AsString;
        sLinha := sLinha + PreparaStr(FieldByName('INSCRICAONUMERO').AsString,                  9);
        sLinha := sLinha + PreparaStr(FieldByName('DTINICIOINSC').AsString,                    10);
        sLinha := sLinha + ColocaZeros( FloatToStr(FieldByName('PERCFACUL').AsFloat  * 10000),  7);
        sLinha := sLinha + ColocaZeros( FloatToStr(FieldByName('VALORESP').AsFloat   * 100),   12);
        sLinha := sLinha + ColocaZeros( FloatToStr(FieldByName('PERCBASICA').AsFloat * 10000),  7);
        sLinha := sLinha + PreparaStr(FieldByName('SITPLA').AsString,                           1);
        sLinha := sLinha + PreparaStr(FieldByName('DATACANCELAMENTO').AsString,                10);
        writeln(F, sLinha);
        Next;
     end;
  end;
  CloseFile(F);
  frmAguarde.Apaga;

  // 3. Arquivo de Contribuições         = CM_CONTRIBUICOES.TXT
  frmAguarde.Mostra('Gerando Arquivo de Contribuições ...');
  //Henrique Massão
  //AssignFile(F, 'C:\CM_CONTRIBUICOES.TXT');
  AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CM_CONTRIBUICOES.TXT');
  Rewrite(F);

  sSQL := ' SELECT ''001'' AS CODFUNDO, DECODE(HST.IDPESSJUR, 1, ''002'',    '+
          '                                                 99, ''001'',    '+
          '                                                     ''XXX'') AS CODPATRO, '+
          '        PP.INSCRICAONUMERO,                                      '+
          '        EL.MATRICULA,                                            '+
          '        HST.MESCOBRANCA,                                         '+
          '        HST.MESREFERENCIA,                                       '+
          '        RP.CODPROVDESC,                                          '+
          '        HST.VALORRECEBIDO,                                       '+
          '        DECODE(HST.FLGDEVOLUCAO, 1, ''P'', ''D'') AS IDPRODES    '+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP , CONTPREV CP, RUBRICAXPESS RP, HSTCONTRIBPREV HST       '+
          ' WHERE  PP.IDPLANOPREV        = 12                               '+
          ' AND    EL.IDPESSJUR          = PP.IDPESSJUR                     '+
          ' AND    EL.IDPESSOA           = PP.IDPESSOA                      '+
          ' AND    HST.IDPESSJUR         = PP.IDPESSJUR                     '+
          ' AND    HST.IDPLANOPREV       = PP.IDPLANOPREV                   '+
          ' AND    HST.IDPESSOA          = PP.IDPESSOA                      '+
          ' AND    HST.SEQPROPOSTA       = PP.SEQPROPOSTA                   '+
          ' AND    CP.IDPLANOPREV        = HST.IDPLANOPREV                  '+
          ' AND    CP.IDCONTRIBUICAO     = HST.IDCONTRIBUICAO               '+
          ' AND    RP.IDPESSOA           = HST.IDPESSJUR                    '+
          ' AND    RP.IDRUBRICA          = CP.IDRUBRICA                     '+
          ' ORDER BY HST.MESREFERENCIA, PP.INSCRICAONUMERO                 ';

  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;

     while not Eof do
     begin
        sLinha := '';
        sLinha :=          FieldByName('CODFUNDO').AsString;
        sLinha := sLinha + FieldByName('CODPATRO').AsString;
        sLinha := sLinha + PreparaStr(FieldByName('INSCRICAONUMERO').AsString,                   9);
        sLinha := sLinha + PreparaStr(FieldByName('MATRICULA').AsString,                        10);
        sLinha := sLinha + PreparaStr( Copy(FieldByName('MESCOBRANCA').AsString,1,4)+Copy(FieldByName('MESCOBRANCA').AsString,6,2),       6);
        sLinha := sLinha + PreparaStr( Copy(FieldByName('MESREFERENCIA').AsString,1,4)+Copy(FieldByName('MESREFERENCIA').AsString,6,2),   6);
        sLinha := sLinha + PreparaStr(FieldByName('CODPROVDESC').AsString,                       4);
        sLinha := sLinha + ColocaZeros( FloatToStr(FieldByName('VALORRECEBIDO').AsFloat * 100), 12);
        sLinha := sLinha + PreparaStr(FieldByName('IDPRODES').AsString,                          1);
        writeln(F, sLinha);
        Next;
     end;
  end;
  CloseFile(F);
  frmAguarde.Apaga;

  // 4. Arquivo de Rubricas              = CM_RUBRICAS.TXT
  frmAguarde.Mostra('Gerando Arquivo de Contribuições ...');
  //Henrique Massão
  //AssignFile(F, 'C:\CM_RUBRICAS.TXT');
  AssignFile(F, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CM_RUBRICAS.TXT ');

  Rewrite(F);

  sSQL := ' SELECT DISTINCT RP.CODPROVDESC, RP.DESCRPROVDESC      '+
          ' FROM   PARTPREVPLAN PP , CONTPREV CP, RUBRICAXPESS RP, HSTCONTRIBPREV HST       '+
          ' WHERE  PP.IDPLANOPREV        = 12                               '+
          ' AND    HST.IDPESSJUR         = PP.IDPESSJUR                     '+
          ' AND    HST.IDPLANOPREV       = PP.IDPLANOPREV                   '+
          ' AND    HST.IDPESSOA          = PP.IDPESSOA                      '+
          ' AND    HST.SEQPROPOSTA       = PP.SEQPROPOSTA                   '+
          ' AND    CP.IDPLANOPREV        = HST.IDPLANOPREV                  '+
          ' AND    CP.IDCONTRIBUICAO     = HST.IDCONTRIBUICAO               '+
          ' AND    RP.IDPESSOA           = HST.IDPESSJUR                    '+
          ' AND    RP.IDRUBRICA          = CP.IDRUBRICA                     '+
          ' ORDER BY RP.CODPROVDESC                                         ';

  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;

     while not Eof do
     begin
        sLinha := '';
        sLinha := sLinha + PreparaStr(Copy(FieldByName('CODPROVDESC').AsString,1,6),        6);
        sLinha := sLinha + PreparaStr(Copy(FieldByName('DESCRPROVDESC').AsString,1,60),    60);
        writeln(F, sLinha);
        Next;
     end;
  end;
  CloseFile(F);
  frmAguarde.Apaga;

  // Término
  MsgDlg('Término do Processo.','Informação',mtInformation,[mbOk],0);
end;

procedure TfrmGeraArqSERPROS.FormCreate(Sender: TObject);
begin
  inherited;
  //Henrique Massão

  memExplicacao.Lines.Text :=
        'Este programa irá gerar os arquivos solicitados pelo SERPROS.'                           + #10#13 +
        'Diretório de Geração dos Arquivos :' + Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + #10#13 +
        'Nome dos Arquivos :'                                                                     + #10#13 +

        '1. Arquivo de Salário de Participação = CM_ARQSALPART.TXT'                               + #10 +
        '2. Arquivo de Participante no Plano = CM_PARTICIPANTE.TXT'                               + #10 +
        '3. Arquivo de Contribuições = CM_CONTRIBUICOES.TXT'                                      + #10 +
        '4. Arquivo de Rubricas = CM_RUBRICAS.TXT'                                                + #10#13 +
        '----------------------------------------------------------------------------------------'+
        '-----------------------------------------------------'+
        'ATENÇÃO : LAY-OUT DO ARQUIVO 4.'                                                         + #10#13 +
        'O LAY-OUT DO ARQUIVO 4 TEVE QUE SER ALTERADO PARA TAMANHOS 6 E 6 0, NO LUGAR'            +
        'DE 3 E 35, POIS EXISTEM DADOS CÓDIGOS COM MAIS DE '                                      +
        '3 POSIÇÕES E DESCRIÇÕES COM MAIS DE 35.';

  end;

end.
