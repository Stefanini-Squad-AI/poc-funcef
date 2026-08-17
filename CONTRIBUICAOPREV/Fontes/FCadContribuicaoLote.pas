unit FCadContribuicaoLote;

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
WO          : 19383
Responsável : Leandro
Data        : 13/03/2025
Descrição   : Incluir campo DATAFINAL na importação do arquivo
-------------------------------------------------------------------------------
Pendência   : 114262
Responsável : edilaine
Data        : 10/01/2022
Descrição   : Criação do Cadastro de Contribuiçoes em Lote
-------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Gauges, Db, DBTables, Wwquery, uMensErro,
  dBaseDados, UDataBase, ComObj, UFuncoesUteis;

type
  TRecDados = Record
     sMATRICULA      : string;
     sIDPESSJUR      : string;
     sIDTPPERIODO    : string;
     sIDPESSOA       : string;
     sIDPLANOPREV    : string;
     sSEQPROPOSTA    : string;
     sIDCONTRIBUICAO : string;
     sDIAVENCIMENTO  : string;
     sCODPORTFORMA   : string;
     sFLGDESCFOLHA   : string;
     sVALORBASE1     : string;
     sVALORBASE2     : string;
     sVALORBASE3     : string;
     sFLGCOBRA       : string;
     sFLGRECALCULA   : string;
     sFLGRETROATIVO  : string;
     sDATAINICIO     : string; //WO19383 Leandro
     sDATAFINAL      : string;
     sIDHISTPROPOSTA : string;
     sCODPORTFORMA13 : string;
     sIDPLANPREVCONTAB : string;
  end;
  TFrmCadContribuicaoLote = class(TfrmOkCancelar)
    gBarradeProgresso: TGauge;
    memArquivo: TMemo;
    QryConsulta: TwwQuery;
    OpenDialog: TOpenDialog;
    qryInclui: TwwQuery;
    qryAux: TwwQuery;
    pnlTopo: TPanel;
    Label2: TLabel;
    edtArquivo: TEdit;
    btnAbreArquivo: TBitBtn;
    btnLimpaArquivo: TBitBtn;
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    recDados     : TRecDados;
    sNomeContrib : string;
    sIdTitular   : string;
    bSair        : boolean;

  public
    { Public declarations }

  end;

var
  FrmCadContribuicaoLote: TFrmCadContribuicaoLote;

implementation

{$R *.DFM}

function iif(bCondicao: Boolean; SeVerdadeiro,
  SeFalso: string): string;
begin
  if bCondicao then
    Result := SeVerdadeiro
  else
    Result := SeFalso;
end;


procedure TFrmCadContribuicaoLote.btnAbreArquivoClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
     edtArquivo.Text := ExtractFileName(OpenDialog.FileName);
end;

procedure TFrmCadContribuicaoLote.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  memArquivo.Clear;
  bSair := False;
end;


procedure TFrmCadContribuicaoLote.bbtnConfirmarClick(Sender: TObject);
var
  excel :variant;
  ilinha, icoluna,
  iLinhaAux,
  iTotLinhas,
  iAtualizados  : integer;
  sMsgErro,
  sMatricula,
  sIdPessoa,
  sIdPessjur,
  sIdPlanoprev  : String;
  lstColDados   : TStringList;
  dDataIni      : TDateTime;
  sHs           : string;
  iInd, iCol    : integer;
  sNomeCols     : string;
  iIdNucleo     : integer;
  bIncluiContr  : boolean;

  iColContr, iColData, iColItem : integer;
begin
  inherited;

  lstColDados := TStringList.create;

  if (edtArquivo.Text = '') then
  begin
     MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Empréstimo', mtWarning, [mbOK], 0);
     Exit;
  end;

  // objetostring usando  name=value pair
  lstColDados.add('MATRICULA=0');
  lstColDados.add('IDPESSJUR=0');
  lstColDados.add('IDTPPERIODICIDADE=0');
  lstColDados.add('IDPESSOA=0');
  lstColDados.add('IDPLANOPREV=0');
  lstColDados.add('SEQPROPOSTA=0');
  lstColDados.add('IDCONTRIBUICAO=0');
  lstColDados.add('DIAVENCIMENTO=0');
  lstColDados.add('CODPORTFORMA=0');
  lstColDados.add('FLGDESCFOLHA=0');
  lstColDados.add('VALORBASE1=0');
  lstColDados.add('VALORBASE2=0');
  lstColDados.add('VALORBASE3=0');
  lstColDados.add('FLGCOBRA=0');
  lstColDados.add('FLGRECALCULA=0');
  lstColDados.add('FLGRETROATIVO=0');
  lstColDados.add('DATAINICIO=0');
  lstColDados.add('DATAFINAL=0'); //WO19383 Leandro
  lstColDados.add('IDHISTPROPOSTA=0');
  lstColDados.add('CODPORTFORMA13=0');
  lstColDados.add('IDPLANPREVCONTAB=0');

  memArquivo.lines.clear;
  dDataIni := Now;

  memArquivo.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
  memArquivo.Lines.Add(' ');

  sHs := FormatDateTime('hh:mm:ss', Now) + ' - ';
  memArquivo.Lines.Add(sHs + 'Carregando os dados para Cadastro das Contribuições');
  memArquivo.Lines.Add(' ');

  try
    try

      Screen.cursor := crHourGlass;

      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := False;
      Excel.WorkBooks.Add(OpenDialog.FileName);

      icoluna:= 0;

      repeat
        inc(iColuna);

        if (Excel.Cells.Item[1,icoluna].Text <> '') then
        begin
          if lstColDados.IndexOfName( UpperCase(Excel.Cells.Item[1,icoluna].Text )) > -1 then
             lstColDados.Values[ UpperCase(Excel.Cells.Item[1,icoluna].Text) ] := intToStr(iColuna);
        end;

      until (Excel.Cells.Item[1,icoluna].Text = '') and (Excel.Cells.Item[2,icoluna].Text = '');

      // verifica se falta colunas obrigatorias no arquivo
      sNomeCols   := '';
      for iInd := 0 to lstColDados.count-1 do
      begin
        if lstColDados.Values[ lstColDados.Names[ iInd ] ] = '0' then
           sNomeCols := sNomeCols + iif(sNomeCols <> '', ', ', '') + lstColDados.Names[iInd];
      end;

      Screen.cursor := crDefault;

      if sNomeCols <> '' then
      begin
        sHs := FormatDateTime('hh:mm:ss', Now) + ' - ';
        memArquivo.Lines.Add(sHs + 'ERRO: faltam colunas: '+sNomeCols);
        memArquivo.Lines.Add(' ');

        MsgDlg('Arquivo fora do padrão. Verifique!.', 'Empréstimo', mtWarning, [mbOK], 0);
        Exit;
      end;

      //conta linhas
      iLinha := 2;
      repeat
        if (Excel.Cells.Item[iLinha,1].Text <> '') then
           inc(iLinha);
      until (Excel.Cells.Item[iLinha,1].Text = '');

      iTotLinhas := iLinha-1;
      gBarradeProgresso.progress := 0;
      gBarradeProgresso.MaxValue := iTotLinhas;


      // inicio do processo
      iLinha       := 1;
      iLinhaAux    := 0;
      iAtualizados := 0;
      bSair := True;
      while bSair do
      begin

        inc(iLinha);

        if Excel.Cells.Item[ilinha,1].Text <> '' then
        begin
           gBarradeProgresso.Progress :=  iLinha;

           if (iLinhaAux = 0) and (not(dtmBaseDados.dbBaseDados.InTransaction)) then
              StartTransacao;

           iInd := 0;
           sMsgErro := '';

           //Carrega Dados
           repeat
           //for iInd := 0 to lstColDados.count-1 do
           //begin
             iCol := StrToInt( lstColDados.Values[ lstColDados.Names[ iInd ] ] );

             case iCol of
                1 : recDados.sMatricula        := Trim(Excel.Cells.Item[ilinha, iCol].text);
                2 : recDados.sIDPESSJUR        := Trim(Excel.Cells.Item[ilinha, iCol].text);
                3 : recDados.sIDTPPERIODO      := Trim(Excel.Cells.Item[ilinha, iCol].text);
                4 : recDados.sIDPESSOA         := Trim(Excel.Cells.Item[ilinha, iCol].text);
                5 : recDados.sIDPLANOPREV      := Trim(Excel.Cells.Item[ilinha, iCol].text);
                6 : recDados.sSEQPROPOSTA      := Trim(Excel.Cells.Item[ilinha, iCol].text);
                7 : recDados.sIDCONTRIBUICAO   := Trim(Excel.Cells.Item[ilinha, iCol].text);
                8 : recDados.sDIAVENCIMENTO    := Trim(Excel.Cells.Item[ilinha, iCol].text);
                9 : recDados.sCODPORTFORMA     := Trim(Excel.Cells.Item[ilinha, iCol].text);
               10 : recDados.sFLGDESCFOLHA     := Trim(Excel.Cells.Item[ilinha, iCol].text);
               11 : recDados.sVALORBASE1       := Trim(Excel.Cells.Item[ilinha, iCol].text);
               12 : recDados.sVALORBASE2       := Trim(Excel.Cells.Item[ilinha, iCol].text);
               13 : recDados.sVALORBASE3       := Trim(Excel.Cells.Item[ilinha, iCol].text);
               14 : recDados.sFLGCOBRA         := Trim(Excel.Cells.Item[ilinha, iCol].text);
               15 : recDados.sFLGRECALCULA     := Trim(Excel.Cells.Item[ilinha, iCol].text);
               16 : recDados.sFLGRETROATIVO    := Trim(Excel.Cells.Item[ilinha, iCol].text);
               17 : recDados.sDATAINICIO       := Trim(Excel.Cells.Item[ilinha, iCol].text);
               //WO19383 Leandro Inicio
               18 : recDados.sDATAFINAL        := Trim(Excel.Cells.Item[ilinha, iCol].text);
               //18 : recDados.sIDHISTPROPOSTA   := Trim(Excel.Cells.Item[ilinha, iCol].text);
               //19 : recDados.sCODPORTFORMA13   := Trim(Excel.Cells.Item[ilinha, iCol].text);
               //20 : recDados.sIDPLANPREVCONTAB := Trim(Excel.Cells.Item[ilinha, iCol].text);
               19 : recDados.sIDHISTPROPOSTA   := Trim(Excel.Cells.Item[ilinha, iCol].text);
               20 : recDados.sCODPORTFORMA13   := Trim(Excel.Cells.Item[ilinha, iCol].text);
               21 : recDados.sIDPLANPREVCONTAB := Trim(Excel.Cells.Item[ilinha, iCol].text);
               //WO19383 Leandro Fim
             end;
             sNomeCols := lstColDados.Names[iInd];

             //if (iCol in [1, 2, 4, 5, 6, 7, 17, 20]) and (Trim(Excel.Cells.Item[ilinha, iCol].text) = '') then //WO19383 Leandro
             if (iCol in [1, 2, 4, 5, 6, 7, 17, 21]) and (Trim(Excel.Cells.Item[ilinha, iCol].text) = '') then
                sMsgErro := ' coluna '+sNomeCols+' vazia';

             if (iCol = 17) and (length(recDados.sDATAINICIO) > 10) then
                recDados.sDATAINICIO := copy(recDados.sDATAINICIO, 1, 10);

             if (iCol = 18) and (length(recDados.sDATAFINAL) > 10) then  //WO19383 Leandro
                recDados.sDATAFINAL := copy(recDados.sDATAFINAL, 1, 10); //WO19383 Leandro

             inc(iInd);
           //end;
           until (iInd > lstColDados.count-1) or (sMsgErro <> '');

           // valida campos
           if sMsgErro <> '' then
           begin
             memArquivo.Lines.Add(sHs + ' [ERRO] '+sMsgErro );

             application.ProcessMessages;
             continue;
           end;


           sHs := FormatDateTime('hh:mm:ss', Now) + ' - Matr: '+recDados.sMatricula;

           //busca contribuicao
           qryConsulta.close;
           qryConsulta.Sql.Clear;
           qryConsulta.Sql.Add('SELECT NOME ');
           qryConsulta.Sql.Add('  FROM CONTRIBUICAO');
           qryConsulta.Sql.Add(' WHERE IDCONTRIBUICAO  = '+recDados.sIDCONTRIBUICAO );
           qryConsulta.Open;
           if qryConsulta.eof then
           begin
             memArquivo.Lines.Add(sHs + ' [ERRO] Contribuição '+recDados.sIDCONTRIBUICAO+' não existe');

             application.ProcessMessages;
             continue;
           end;

           sNomeContrib := qryConsulta.FieldByName('NOME').AsString;

           //verifica se é titular
           qryConsulta.close;
           qryConsulta.Sql.Clear;
           qryConsulta.Sql.Add('SELECT PF.DATAMORTE, DP.*, ');
           qryConsulta.Sql.Add('       DECODE(DP.IDPESSOA, DP.IDTITULAR, ''TIT'', ''DEP'') AS TIPO ');
           qryConsulta.Sql.Add('  FROM DEPENTIT DP');
           qryConsulta.Sql.Add('  JOIN PESSOAFISICA PF');
           qryConsulta.Sql.Add('    ON PF.IDPESSOA = DP.IDPESSOA');
           qryConsulta.Sql.Add(' WHERE DP.MATRICULA = '+Quotedstr(recDados.sMatricula) );
           qryConsulta.Sql.Add('   AND DP.IDPESSOA  = '+recDados.sIdpessoa );
           qryConsulta.Open;

           //nao localizou, pula para próxima linha
           if (not qryConsulta.isEmpty) then
           begin
             //se for Dependente, insere para nucleo, senao insere para participante
             if qryConsulta.FieldByName('TIPO').AsString = 'DEP' then
             begin
               bIncluiContr := true;

               //verifica nucleo familiar
               qryAux.close;
               qryAux.Sql.Clear;
               qryAux.Sql.Add('SELECT NF.IDNUCLEOFAMILIAR, NF.IDTITULAR ');
               qryAux.Sql.Add('  FROM NUCLEOFAMILIAR NF');
               qryAux.Sql.Add(' WHERE NF.IDRESPNUCLEO = '+recDados.sIdpessoa );
               qryAux.Open;

               // insere nucleo, se nao tiver
               if not qryAux.eof then
               begin
                 iIdNucleo  := qryAux.FieldByName('IDNUCLEOFAMILIAR').AsInteger;
                 sIdTitular := qryAux.FieldByName('IDTITULAR').AsString;

                 //verifica se contribuiçao ja esta vinculada ao nucleo
                 qryAux.close;
                 qryAux.Sql.Clear;
                 qryAux.Sql.Add('SELECT C.NOME, CN.*');
                 qryAux.Sql.Add('  FROM CONTRIBPREVNUCLEO CN ');
                 qryAux.Sql.Add('  JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = CN.IDCONTRIBUICAO ');
                 qryAux.Sql.Add(' WHERE CN.IDCONTRIBUICAO   = '+recDados.sIdContribuicao );
                 qryAux.Sql.Add('   AND CN.IDNUCLEOFAMILIAR = '+IntToStr(iIdNucleo) );
                 qryAux.Open;
                 if not qryAux.eof then
                 begin
                    if recDados.sFLGCOBRA <> qryAux.FieldByName('FLGCOBRA').AsString then
                    begin
                      qryInclui.close;
                      qryInclui.Sql.Clear;
                      qryInclui.Sql.Add('UPDATE CM.CONTRIBPREVNUCLEO ');
                      qryInclui.Sql.Add('   SET FLGCOBRA = '+QuotedStr(recDados.sFLGCOBRA) );
                      qryInclui.Sql.Add('   , DATAFINAL = '+QuotedStr(recDados.sDATAFINAL) ); //WO19383 LEANDRO
                      qryInclui.Sql.Add(' WHERE IDCONTRIBUICAO   = '+recDados.sIdContribuicao );
                      qryInclui.Sql.Add('   AND IDNUCLEOFAMILIAR = '+IntToStr(iIdNucleo) );
                      qryInclui.ExecSQL;

                      memArquivo.Lines.Add(sHs + ' [OK] '+sNomeContrib+' cobrança atualizada');

                    end;
                    bIncluiContr := false;
                 end;
               end
               else
               begin
                 try
                   qryAux.close;
                   qryAux.Sql.Clear;
                   qryAux.Sql.Add('SELECT SEQNUCLEOFAMILIAR.NEXTVAL FROM DUAL');
                   qryAux.Open;

                   iIdNucleo  := qryAux.FieldByName('IDNUCLEOFAMILIAR').AsInteger;
                   sIdTitular := qryConsulta.FieldByName('IDTITULAR').AsString;

                   qryAux.close;
                   qryAux.Sql.Clear;
                   qryAux.Sql.Add('INSERT INTO NUCLEOFAMILIAR (IDNUCLEOFAMILIAR, IDRESPNUCLEO, IDTITULAR) ');
                   qryAux.Sql.Add('VALUES ('+IntToStr(iIdNucleo) +', '+ recDados.sIdpessoa +', ' );
                   qryAux.Sql.Add(qryConsulta.FieldByName('IDTITULAR').AsString + ') '  );
                   qryAux.ExecSQL;

                 except
                   bIncluiContr := false;
                 end;
               end;

               if bIncluiContr then
               begin
                 qryInclui.close;
                 qryInclui.Sql.clear;
                 qryInclui.Sql.Add('INSERT INTO CM.CONTRIBPREVNUCLEO ( ');
                 //qryInclui.Sql.Add('  IDCONTRIBUICAO, IDNUCLEOFAMILIAR, DATAINICIO, FLGCOBRA, ');  //WO19383 Leandro
                 qryInclui.Sql.Add('  IDCONTRIBUICAO, IDNUCLEOFAMILIAR, DATAINICIO, DATAFINAL, FLGCOBRA, ');    //WO19383 Leandro
                 qryInclui.Sql.Add('  IDPESSOA, IDPESSJUR, IDTITULAR, SEQPROPOSTA, CODPORTFORMA, ');
                 qryInclui.Sql.Add('  CODPORTFORMA13, IDPLANPREVCONTAB ' );
                 qryInclui.Sql.Add(') VALUES ( ' );
                 qryInclui.Sql.Add( recDados.sIdContribuicao +', ' );
                 qryInclui.Sql.Add( IntToStr(iIdNucleo)    +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sDATAINICIO)   +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sDATAFINAL)    +', ' );  //WO19383 LEANDRO
                 qryInclui.Sql.Add( QuotedStr(recDados.sFLGCOBRA)     +', ' );
                 qryInclui.Sql.Add( recDados.sIDPESSOA     +', ' );
                 qryInclui.Sql.Add( recDados.sIDPESSJUR    +', ' );
                 qryInclui.Sql.Add( sIDTITULAR             +', ' );
                 qryInclui.Sql.Add( recDados.sSEQPROPOSTA  +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sCODPORTFORMA) +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sCODPORTFORMA13) +', ' );
                 qryInclui.Sql.Add( recDados.sIDPLANPREVCONTAB     );
                 qryInclui.Sql.Add(') ' );
                 qryInclui.ExecSQL;

                 memArquivo.Lines.Add(sHs + ' [OK] '+sNomeContrib+' inserida cobrança para núcleo');
               end;
             end
             else    // trata participante
             begin

               bIncluiContr := true;

               //verifica se contribuiçao ja esta vinculada ao nucleo
               qryAux.close;
               qryAux.Sql.Clear;
               qryAux.Sql.Add('SELECT C.NOME, CN.*');
               qryAux.Sql.Add('  FROM CONTRIBPREVPARTP CN ');
               qryAux.Sql.Add('  JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = CN.IDCONTRIBUICAO ');
               qryAux.Sql.Add(' WHERE CN.IDCONTRIBUICAO   = '+recDados.sIdContribuicao );
               qryAux.Sql.Add('   AND CN.IDPESSOA = '+recDados.sIDPESSOA );
               qryAux.Open;
               if not qryAux.eof then
               begin
                  if recDados.sFLGCOBRA <> qryAux.FieldByName('FLGCOBRA').AsString then
                  begin
                    qryInclui.close;
                    qryInclui.Sql.Clear;
                    qryInclui.Sql.Add('UPDATE CM.CONTRIBPREVPARTP ');
                    qryInclui.Sql.Add('   SET FLGCOBRA = '+QuotedStr(recDados.sFLGCOBRA) );
                    qryInclui.Sql.Add('   , DATAFINAL = '+QuotedStr(recDados.sDATAFINAL) ); //WO19383 LEANDRO
                    qryInclui.Sql.Add(' WHERE IDCONTRIBUICAO = '+recDados.sIdContribuicao );
                    qryInclui.Sql.Add('   AND IDPESSOA       = '+recDados.sIDPESSOA    );
                    qryInclui.Sql.Add('   AND IDPLANOPREV    = '+recDados.sIDPLANOPREV );
                    qryInclui.Sql.Add('   AND IDPESSJUR      = '+recDados.sIDPESSJUR   );
                    qryInclui.Sql.Add('   AND SEQPROPOSTA    = '+recDados.sSEQPROPOSTA );
                    qryInclui.ExecSQL;

                    memArquivo.Lines.Add(sHs + ' [OK] '+sNomeContrib+' cobrança atualizada');

                  end;
                  bIncluiContr := false;
               end;

               if bIncluiContr then
               begin
                 qryInclui.close;
                 qryInclui.Sql.clear;
                 qryInclui.Sql.Add('INSERT INTO CM.CONTRIBPREVPARTP ( ');
                 qryInclui.Sql.Add('IDPESSJUR, IDTPPERIODICIDADE, IDPESSOA, IDPLANOPREV, SEQPROPOSTA, ');
                 qryInclui.Sql.Add('IDCONTRIBUICAO, DIAVENCIMENTO, IDPLANOBENEF,                      ');
                 qryInclui.Sql.Add('CODPORTFORMA, FLGDESCFOLHA, VALORBASE1, VALORBASE2, VALORBASE3,   ');
                 //qryInclui.Sql.Add('FLGCOBRA, FLGRECALCULA, FLGRETROATIVO, DATAINICIO,                '); //wo19383 LEANDRO
                 qryInclui.Sql.Add('FLGCOBRA, FLGRECALCULA, FLGRETROATIVO, DATAINICIO, DATAFINAL,     ');   //WO19383 LEANDRO
                 qryInclui.Sql.Add('IDHISTPROPOSTA, CODPORTFORMA13, IDPLANPREVCONTAB                  ');
                 qryInclui.Sql.Add(') VALUES ( ' );
                 qryInclui.Sql.Add( recDados.sIDPESSJUR       +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sIDTPPERIODO) +', ' );
                 qryInclui.Sql.Add( recDados.sIDPESSOA        +', ' );
                 qryInclui.Sql.Add( recDados.sIDPLANOPREV     +', ' );
                 qryInclui.Sql.Add( recDados.sSEQPROPOSTA     +', ' );
                 qryInclui.Sql.Add( recDados.sIDCONTRIBUICAO  +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sDIAVENCIMENTO) +', ' );
                 //qryInclui.Sql.Add( recDados.sIDPESSOA        +', ' ); //WO19383 Leandro
                 qryInclui.Sql.Add( recDados.sIDPLANOPREV        +', ' );  //WO19383 Leandro
                 qryInclui.Sql.Add( QuotedStr(recDados.sCODPORTFORMA)    +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sFLGDESCFOLHA)    +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sVALORBASE1)      +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sVALORBASE2)      +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sVALORBASE3)      +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sFLGCOBRA)        +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sFLGRECALCULA)    +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sFLGRETROATIVO)   +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sDATAINICIO) +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sDATAFINAL) +', ' ); //WO19383 LEANDRO
                 qryInclui.Sql.Add( QuotedStr(recDados.sIDHISTPROPOSTA)  +', ' );
                 qryInclui.Sql.Add( QuotedStr(recDados.sCODPORTFORMA13)  +', ' );
                 qryInclui.Sql.Add( recDados.sIDPLANPREVCONTAB );
                 qryInclui.Sql.Add( ')' );
                 qryInclui.ExecSQL;

                 memArquivo.Lines.Add(sHs + ' [OK] '+sNomeContrib+' inserida cobrança para participante');

               end;
             end;
           end
           else
           begin
             memArquivo.Lines.Add(sHs + ' [ERRO] matrícula não localizada');
           end;

           if qryInclui.RowsAffected > 0 then
           begin
              iAtualizados := iAtualizados + 1;
              iLinhaAux    := iLinhaAux + 1;
              if iLinhaAux = 50 then
              begin
                 dtmBaseDados.dbBaseDados.Commit;
                 iLinhaAux := 0;
              end;
           end;

           application.ProcessMessages;
        end
        else
            bSair := False;
      end;

      if (iLinhaAux > 0) and (iLinhaAux < 50) then
         dtmBaseDados.dbBaseDados.Commit;
         
      memArquivo.Lines.Add('-------------------------------------------------------------------------');
      memArquivo.Lines.Add('Total de linhas Processadas.: ' + IntToStr(iLinha-2));
      memArquivo.Lines.Add('Total de Cadastros efetuados: ' + IntToStr(iAtualizados));

    Except
       memArquivo.Lines.Add(sHs + ' [ERRO] não foi possível tratar Contribuição linha: '+IntToStr(iLinha));

       dtmBaseDados.dbBaseDados.Rollback;
       btnLimpaArquivo.Click;
    end;

  finally
     Excel.Quit;
     Excel := Unassigned;
     lstColDados.free;

     memArquivo.Lines.Add(' ');
     memArquivo.Lines.Add('Final do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
     memArquivo.Lines.Add(' ');
     memArquivo.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));
  end;

end;


procedure TFrmCadContribuicaoLote.bbtnSairClick(Sender: TObject);
begin
  inherited;
  bSair := False;
end;

end.
