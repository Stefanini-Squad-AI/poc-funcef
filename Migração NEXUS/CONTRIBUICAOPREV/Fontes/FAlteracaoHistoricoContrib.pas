{-------------------------------------------------------------------------------

CRIAÇÃO
--------------------------------------------------------------------------------
Pendência   : SIG99102
Responsável : Ewerton Beltramini
Data        : 18/03/2020
Descrição   : Criação de form para Atualização  /  Exclusão de dados do Historico de
              contribuição.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
Alteração  : CaminhoParaSalvarArquivo
Nº WO......: 9432
Data.......: 22/03/2024
Responsável: Andre Imakawa
Descrição..: Alteração do \\FUNCEF.COM.BR\ARQUIVOS pasta Compartilhada
--------------------------------------------------------------------------------
Alteração  : CaminhoParaSalvarArquivo
Nº WO......: 8381
Data.......: 28/02/2024
Responsável: Andre Imakawa
Descrição..: Alteração do ALTARF para \\FUNCEF.COM.BR\ARQUIVOS
--------------------------------------------------------------------------------
Solicitãção : 126555
Responsável : Ewerton Beltramini
Data        : 22/06/2022
Descrição   : Inclusão do campo IDLOTE da tabela hstcontribprev.
--------------------------------------------------------------------------------
Pendência   : SIG122316
Responsável : Ewerton Beltramini
Data        : 17/01/2022
Descrição   : Inclusão do campo:   NUMRECEBIMENTOPAI
--------------------------------------------------------------------------------
Solicitãção : 101465
Responsável : Ewerton Beltramini
Data        : 17/08/2021
Descrição   : Permitir alteracoes em contribuicoes já alimentadas para grupo
              especifico.
--------------------------------------------------------------------------------
Pendência   : SIG100856
Responsável : Edilaine
Data        : 24/07/2020
Descrição   : Ajustes para permitir alteracoes em contribuicoes já alimentadas
--------------------------------------------------------------------------------
Pendência   : SIG100273
Responsável : Rafael Vasconcelos
Data        : 03/06/2020
Descrição   : Inclusão do campo IdContribuicao.
--------------------------------------------------------------------------------
Pendência   : SIG99710
Responsável : Rafael Vasconcelos
Data        : 05/05/2020
Descrição   : Inclusão do campo IdPlanoPrev.
--------------------------------------------------------------------------------}

unit FAlteracaoHistoricoContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro,dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj;

type
  TFrmAlteracaoHistoricoContrib = class(TfrmOkCancelar)
    edtArquivo: TEdit;
    btnAbreArquivo: TBitBtn;
    btnLimpaArquivo: TBitBtn;
    Label2: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    OpenDialog: TOpenDialog;
    memArquivo: TMemo;
    qryDel: TwwQuery;
    qryUpdate: TwwQuery;
    RgTipoOperacao: TRadioGroup;
    btnModelo: TSpeedButton;
    chkContribuicaoAlimentada: TCheckBox;
    QryImpAux: TwwQuery;
    QryVerificacao: TwwQuery;   //SIG101465
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FazerRefresh;
    procedure FormShow(Sender: TObject);
    procedure RgTipoOperacaoClick(Sender: TObject);
    procedure btnModeloClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteracaoHistoricoContrib: TFrmAlteracaoHistoricoContrib;

implementation


uses FPrincipal, UAdmPrev, USistema;

{$R *.DFM}

procedure TFrmAlteracaoHistoricoContrib.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  memArquivo.Clear;
end;

procedure TFrmAlteracaoHistoricoContrib.btnAbreArquivoClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
     edtArquivo.Text := OpenDialog.FileName;
end;

procedure TFrmAlteracaoHistoricoContrib.bbtnConfirmarClick(Sender: TObject);
var
excel :variant;
ilinha,icoluna, iContCampos, iPLNCODIGO : integer;  //SIG101465
bSair, bVerificacao : boolean;
sNumRecebimento, sIdplanoPrev ,sMesReferencia, sMesCobranca, sIdMotivo, sIdPessoa, sValorEsperado, sDataRecebimento, 
sValorRecebido, sDataPrevisaoRece, sValorBase1, sCodDocumentoPrev, sFlgCalcReserva, sValorCalculado, sValorOp1, 
sSitRecebimento, sFlgDevolucao, sFolhaOrigem, sIdTitular, sIdPlanPrevContab,sIdContribuicao,sSalPart, sSqlAux, sNumRecebimentoPai, sIdLote : String;

begin
  inherited;

  if RgTipoOperacao.ItemIndex = -1 then
  begin
       MsgDlg('É necessário selecionar o Tipo da Operação (Atualização/Exclusão)!', 'Contribuição-Prev', mtWarning, [mbOK], 0);
       Exit;
  end;

  if (edtArquivo.Text = '') then
  begin
       MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Contribuição-Prev', mtWarning, [mbOK], 0);
       Exit;
  end;


  memArquivo.Lines.Add('Carregando os dados...');

  try

      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := False;
      Excel.WorkBooks.Add(OpenDialog.FileName);

      memArquivo.Lines.Add('Lendo e processando os dados do arquivo informado...');

      StartTransacao;
      iLinha := 2;
      bSair := True;

      if RgTipoOperacao.ItemIndex = 0 then
      begin
            while bSair do
            begin
                    if Excel.Cells.Item[ilinha,1].Text <> '' then
                    begin
                          //Trantando os valores vindos do excel...
                          sNumRecebimento   := Excel.Cells.Item[ilinha,1].Value;
                          sMesReferencia    := Excel.Cells.Item[ilinha,2].Value;
                          sMesCobranca      := Excel.Cells.Item[ilinha,3].Value;
                          sIdMotivo         := Excel.Cells.Item[ilinha,4].Value;
                          sIdPessoa         := Excel.Cells.Item[ilinha,5].Value;
                          sValorEsperado    := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,6].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sDataRecebimento  := Excel.Cells.Item[ilinha,7].Value;
                          //edilaine SIG100856 : inicio
                          if LowerCase(Excel.Cells.Item[ilinha,8].Value) = 'nulo' then
                             sValorRecebido := Excel.Cells.Item[ilinha,8].Value
                          else
                             sValorRecebido := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,8].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          //edilaine SIG100856 : fim
                          sDataPrevisaoRece := Excel.Cells.Item[ilinha,9].Value;
                          sValorBase1       := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,10].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sCodDocumentoPrev := Excel.Cells.Item[ilinha,11].Value;
                          sFlgCalcReserva   := Excel.Cells.Item[ilinha,12].Value;
                          sValorCalculado   := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,13].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sValorOp1         := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,14].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sSitRecebimento   := Excel.Cells.Item[ilinha,15].Value;
                          sFlgDevolucao     := Excel.Cells.Item[ilinha,16].Value;
                          sFolhaOrigem      := Excel.Cells.Item[ilinha,17].Value;
                          sIdTitular        := Excel.Cells.Item[ilinha,18].Value;
                          sIdPlanPrevContab := Excel.Cells.Item[ilinha,19].Value;
                          sIdplanoPrev      := Excel.Cells.Item[ilinha,20].Value; //SIG 99710
                          sIdContribuicao   := Excel.Cells.Item[ilinha,21].Value; //SIG 100273
                          sSalPart          := StringReplace(StringReplace(FormatFloat('#.##', Excel.Cells.Item[ilinha,22].Value),'.','',[rfReplaceAll]),',','.',[rfReplaceAll]);
                          sNumRecebimentoPai := Excel.Cells.Item[ilinha,23].Value;     //Ewerton Beltramini - SIG122316
                          sIdLote           := Excel.Cells.Item[ilinha,24].Value; //SIG 126555

                          iContCampos:= 0;

                          if sNumRecebimento    = ''  then  sNumRecebimento   := '0';
                          if sMesReferencia     = ''  then  sMesReferencia    := 'NULL' else inc(iContCampos);
                          if sMesCobranca       = ''  then  sMesCobranca      := 'NULL' else inc(iContCampos);
                          if sIdMotivo          = ''  then  sIdMotivo         := '0'    else inc(iContCampos);
                          if sIdPessoa          = ''  then  sIdPessoa         := '0'    else inc(iContCampos);
                          if sValorEsperado     = ''  then  sValorEsperado    := '0'    else inc(iContCampos);
                          if sDataRecebimento   = ''  then  sDataRecebimento  := 'NULL' else inc(iContCampos);
                          if sValorRecebido     = ''  then  sValorRecebido    := '0'    else inc(iContCampos);
                          if sDataPrevisaoRece  = ''  then  sDataPrevisaoRece := 'NULL' else inc(iContCampos);
                          if sValorBase1        = ''  then  sValorBase1       := '0'    else inc(iContCampos);
                          if sCodDocumentoPrev  = ''  then  sCodDocumentoPrev := '0'    else inc(iContCampos);
                          if sFlgCalcReserva    = ''  then  sFlgCalcReserva   := '0'    else inc(iContCampos);
                          if sValorCalculado    = ''  then  sValorCalculado   := '0'    else inc(iContCampos);
                          if sValorOp1          = ''  then  sValorOp1         := '0'    else inc(iContCampos);
                          if sSitRecebimento    = ''  then  sSitRecebimento   := 'NULL' else inc(iContCampos);
                          if sFlgDevolucao      = ''  then  sFlgDevolucao     := '0'    else inc(iContCampos);
                          if sFolhaOrigem       = ''  then  sFolhaOrigem      := 'NULL' else inc(iContCampos);
                          if sIdTitular         = ''  then  sIdTitular        := '0'    else inc(iContCampos);
                          if sIdPlanPrevContab  = ''  then  sIdPlanPrevContab := '0'    else inc(iContCampos);
                          if sIdplanoPrev       = ''  then  sIdplanoPrev      := '0'    else inc(iContCampos); //SIG 99710
                          if sIdContribuicao    = ''  then  sIdContribuicao   := '0'    else inc(iContCampos); //SIG 100273
                          if sSalPart           = ''  then  sSalPart          := '0'    else inc(iContCampos);
                          if sNumRecebimentoPai = ''  then  sNumRecebimentoPai := '0'    else inc(iContCampos); //Ewerton Beltramini - SIG122316
                          if sIdLote            = ''  then  sIdLote           := '0'    else inc(iContCampos); //SIG 126555

                          if (sNumRecebimento <> '0') and (iContCampos > 0) then
                          begin
                              sSqlAux := '';
                              qryUpdate.Close;
                              sSqlAux := ' update Hstcontribprev set ';
                              sSqlAux := sSqlAux + ' NUMRECEBIMENTO    = ' + sNumRecebimento;
                              if (sMesReferencia    <> 'NULL') then begin sSqlAux := sSqlAux + ' ,MESREFERENCIA    = ' + QuotedStr(sMesReferencia);     end;
                              if (sMesCobranca      <> 'NULL') then begin sSqlAux := sSqlAux + ' ,MESCOBRANCA      = ' + QuotedStr(sMesCobranca);       end;
                              if (sIdMotivo         <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDMOTIVO 	     = '   + sIdMotivo;                     end;
                              if (sIdPessoa         <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDPESSOA         = ' + sIdPessoa;                     end;
                              if (sValorEsperado    <> '0'   ) then begin sSqlAux := sSqlAux + ' ,VALORESPERADO    = ' + sValorEsperado;                end;
                              //edilaine SIG100856 : inicio
                              if (LowerCase(sDataRecebimento) = 'nulo') then
                              begin
                                 sSqlAux := sSqlAux + ' ,DATARECEBIMENTO  = NULL';
                                 sDataRecebimento := 'NULL';
                              end;
                              //edilaine SIG100856 : fim
                              if (sDataRecebimento  <> 'NULL') then begin sSqlAux := sSqlAux + ' ,DATARECEBIMENTO  = ' + QuotedStr(sDataRecebimento);   end;

                              //edilaine SIG100856 : inicio
                              if (LowerCase(sValorRecebido) = 'nulo') then
                              begin
                                 sSqlAux := sSqlAux + ' ,VALORRECEBIDO  = NULL';
                                 sValorRecebido := '0';
                              end;
                              //edilaine SIG100856 : fim
                              if (sValorRecebido    <> '0'   ) then begin sSqlAux := sSqlAux + ' ,VALORRECEBIDO    = ' + sValorRecebido;                end;
                              if (sDataPrevisaoRece <> 'NULL') then begin sSqlAux := sSqlAux + ' ,DATAPREVISAORECE = ' + QuotedStr(sDataPrevisaoRece);  end;
                              if (sValorBase1       <> '0'   ) then begin sSqlAux := sSqlAux + ' ,VALORBASE1 	     = ' + sValorBase1;                   end;

                              //edilaine SIG100856 : inicio
                              if (LowerCase(sCodDocumentoPrev) = 'nulo') then
                              begin
                                 sSqlAux := sSqlAux + ' ,CODDOCUMENTOPREV  = NULL';
                                 sCodDocumentoPrev := '0';
                              end;
                              //edilaine SIG100856 : fim
                              if (sCodDocumentoPrev <> '0'   ) then begin sSqlAux := sSqlAux + ' ,CODDOCUMENTOPREV = ' + sCodDocumentoPrev;             end;
                              if (sFlgCalcReserva   <> '0'   ) then begin sSqlAux := sSqlAux + ' ,FLGCALCRESERVA   = ' + sFlgCalcReserva;               end;
                              if (sValorCalculado   <> '0'   ) then begin sSqlAux := sSqlAux + ' ,VALORCALCULADO   = ' + sValorCalculado;               end;
                              if (sValorOp1         <> '0'   ) then begin sSqlAux := sSqlAux + ' ,VALOROP1 	       = '   + sValorOp1;                   end;
                              if (sSitRecebimento   <> 'NULL') then begin sSqlAux := sSqlAux + ' ,SITRECEBIMENTO   = ' + QuotedStr(sSitRecebimento);    end;
                              if (sFlgDevolucao     <> '0'   ) then begin sSqlAux := sSqlAux + ' ,FLGDEVOLUCAO     = ' + sFlgDevolucao;                 end;
                              if (sFolhaOrigem      <> 'NULL') then begin sSqlAux := sSqlAux + ' ,FOLHAORIGEM      = ' + QuotedStr(sFolhaOrigem);       end;
                              if (sIdTitular        <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDTITULAR 	     = ' + sIdTitular;                    end;
                              if (sIdPlanPrevContab <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDPLANPREVCONTAB = ' + sIdPlanPrevContab;             end;
                              if (sIdplanoPrev      <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDPLANOPREV      = ' + sIdplanoPrev;                  end; //SIG 99710
                              if (sIdContribuicao   <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDCONTRIBUICAO   = ' + sIdContribuicao;               end; //SIG 100273
                              if (sSalPart          <> '0'   ) then begin sSqlAux := sSqlAux + ' ,SALCONTRIB 	     = ' + sSalPart;                      end;
                              if (sNumRecebimentoPai <> '0'  ) then begin sSqlAux := sSqlAux + ' ,NUMRECEBIMENTOPAI = ' + sNumRecebimentoPai;           end;  //Ewerton Beltramini - SIG122316
                              if (sIdLote           <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDLOTE           = ' + sIdLote;                       end; //SIG 126555

                              sSqlAux := sSqlAux + ' where NUMRECEBIMENTO = ' + sNumRecebimento;

                              //Ewerton Beltramini - 18/08/2021 - SIG101465
                              if chkContribuicaoAlimentada.State = cbUnchecked then
                                 sSqlAux := sSqlAux + ' and FLGCALCRESERVA = 0';

                              qryUpdate.SQL.Text:= sSqlAux;
                              try //SIG 99710
                                qryUpdate.ExecSql;
                                if qryUpdate.RowsAffected > 0 then
                                   memArquivo.Lines.Add('--> Nº do Recebimento Atualizado: ' + Trim(Excel.Cells.Item[ilinha,1].text))
                                else
                                //edilaine SIG100856 : inicio
                                begin
                                  sSqlAux := '';
                                  qryUpdate.Close;
                                  sSqlAux := ' update Hstcontribprev set ';
                                  sSqlAux := sSqlAux + ' NUMRECEBIMENTO    = ' + sNumRecebimento;
                                  if (sValorEsperado    <> '0'   ) then begin sSqlAux := sSqlAux + ' ,VALORESPERADO    = ' + sValorEsperado;                end;
                                  if (sDataPrevisaoRece <> 'NULL') then begin sSqlAux := sSqlAux + ' ,DATAPREVISAORECE = ' + QuotedStr(sDataPrevisaoRece);  end;
                                  if (sValorOp1         <> '0'   ) then begin sSqlAux := sSqlAux + ' ,VALOROP1 	       = ' + sValorOp1;                     end;
                                  if (sIdPlanPrevContab <> '0'   ) then begin sSqlAux := sSqlAux + ' ,IDPLANPREVCONTAB = ' + sIdPlanPrevContab;             end;
                                  if (sSalPart         <>  '0'   ) then begin sSqlAux := sSqlAux + ' ,SALCONTRIB 	     = ' + sSalPart;                      end;
                                  sSqlAux := sSqlAux + ' where NUMRECEBIMENTO = ' + sNumRecebimento;
                                  qryUpdate.SQL.Text:= sSqlAux;
                                  qryUpdate.ExecSql;
                                  if qryUpdate.RowsAffected > 0 then
                                     memArquivo.Lines.Add('--> Nº do Recebimento Atualizado: ' + Trim(Excel.Cells.Item[ilinha,1].text))
                                  else
                                     memArquivo.Lines.Add('--> Nº do Recebimento não localizado: ' + Trim(Excel.Cells.Item[ilinha,1].text));
                                end;
                                //edilaine SIG100856 : fim
                               Except //SIG 99710
                                 on E: Exception do         //SIG 99710
                                   begin //SIG 99710
                                    memArquivo.Lines.Add('--> Erro ao alterar o N° Recebimento: ' + Trim(Excel.Cells.Item[ilinha,1].text) + 'Erro: '+ E.Message ); //SIG 99710
                                   end; //SIG 99710
                              end; //SIG 99710
                        end;

                          iLinha := iLinha + 1;

                    end
                    else
                        bSair := False;
            end;
      end
      else if RgTipoOperacao.ItemIndex = 1 then
      begin
            while bSair do
            begin
                    if Excel.Cells.Item[ilinha,1].Text <> '' then
                    begin
                          //Trantando os valores vindos do excel...
                          sNumRecebimento   := Excel.Cells.Item[ilinha,1].Value;
                          if sNumRecebimento    = ''  then  sNumRecebimento   := '0';

                          if (sNumRecebimento <> '0') then
                          begin
                                qry.Close;
                                qry.sql.Clear;
                                qry.Sql.Add('select * from Hstcontribprev ');
                                //Ewerton Beltramini - 18/08/2021 - SIG101465
                                if chkContribuicaoAlimentada.State = cbUnchecked then
                                   qry.Sql.Add('where FLGCALCRESERVA = 0 and NUMRECEBIMENTO =  ' + sNumRecebimento)
                                else
                                   qry.Sql.Add('where NUMRECEBIMENTO =  ' + sNumRecebimento);
                                qry.open;

                                if (qry.recordcount = 1) then
                                begin
                                //SIG101465 - inicio...

                                          bVerificacao := False;
                                          if not (qry.FieldByName('CODDOCUMENTOPREV').IsNull) then
                                          begin
                                                QryVerificacao.Close;
                                                QryVerificacao.sql.Clear;
                                                QryVerificacao.Sql.Add('select STATUS from documento where CODDOCUMENTO =  ' + qry.FieldByName('CODDOCUMENTOPREV').AsString);
                                                QryVerificacao.open;

                                                if (QryVerificacao.RecordCount > 1) then
                                                begin
                                                     memArquivo.Lines.Add('--> Foram encontrados registros diversos vinculados ao Documento.' + #13 + 'Não é possível excluí-los!' + Trim(Excel.Cells.Item[ilinha,1].text));
                                                end
                                                else if (QryVerificacao.RecordCount = 1) and (QryVerificacao.FieldByName('STATUS').AsString = '2') then
                                                begin
                                                     memArquivo.Lines.Add('--> O Registro não pode ser excluído, porque o Documento encontra-se com o status de baixado.' + Trim(Excel.Cells.Item[ilinha,1].text));
                                                end
                                                else if (QryVerificacao.RecordCount = 1) and (QryVerificacao.FieldByName('STATUS').AsString <> '2') then
                                                begin
                                                      bVerificacao:= True;
                                                end;
                                          end;

                                          if (qry.FieldByName('CODDOCUMENTOPREV').IsNull) or (bVerificacao) then
                                          begin
                                //SIG101465 - Fim
                                               //edilaine SIG100856 : inicio
                                               qryUpdate.Close;
                                               qryUpdate.SQL.Text:= ' delete from HstAtrasocontrib ' +
                                                                    ' where NUMRECEBIMENTO = ' + sNumRecebimento;
                                               try
                                                    qryUpdate.ExecSql;
                                               Except
                                                 on E: Exception do
                                                  begin
                                                    memArquivo.Lines.Add('--> Erro ao excluir Alteradores Nº do Recebimento: ' + Trim(Excel.Cells.Item[ilinha,1].text) + ' Erro: '+ E.Message ); //SIG 99710
                                                  end;
                                               end;
                                               //edilaine SIG100856 : fim

                                //SIG101465 - Inicio...
                                               if (bVerificacao) then
                                               begin
                                                     //rateiodocum..................................................................
                                                     qryUpdate.Close;
                                                     qryUpdate.SQL.Text:= 'delete from rateiodocum where CODDOCUMENTO = ' + QryVerificacao.FieldByName('CODDOCUMENTO').AsString;
                                                     try
                                                          qryUpdate.ExecSql;
                                                     Except
                                                       on E: Exception do
                                                        begin
                                                             memArquivo.Lines.Add('--> Erro ao excluir o(s) registro(s) na tabela Rateiodocum.  Nº do Recebimento:' + Trim(Excel.Cells.Item[ilinha,1].text) + ' Erro: '+ E.Message );
                                                        end;
                                                     end;

                                                     //lanctodocum..................................................................
                                                     iPLNCODIGO := 0;
                                                     qryUpdate.Close;
                                                     qryUpdate.SQL.Text:= 'Select PLNCODIGO from lanctodocum where CODDOCUMENTO = ' + QryVerificacao.FieldByName('CODDOCUMENTO').AsString;
                                                     qryUpdate.Open;
                                                     iPLNCODIGO := qryUpdate.FieldByName('PLNCODIGO').AsInteger;

                                                     qryUpdate.Close;
                                                     qryUpdate.SQL.Text:= 'delete from lanctodocum where CODDOCUMENTO = ' + QryVerificacao.FieldByName('CODDOCUMENTO').AsString;
                                                     try
                                                          qryUpdate.ExecSql;
                                                     Except
                                                       on E: Exception do
                                                        begin
                                                             memArquivo.Lines.Add('--> Erro ao excluir o(s) registro(s) na tabela Lanctodocum.  Nº do Recebimento:' + Trim(Excel.Cells.Item[ilinha,1].text) + ' Erro: '+ E.Message );
                                                        end;
                                                     end;

                                                     //Planilha.....................................................................
                                                     qryUpdate.Close;
                                                     qryUpdate.SQL.Text:= 'update planilha set plntotdeb = 0, plntotcre = 0 where PLNCODIGO = ' +  IntToStr(iPLNCODIGO);
                                                     try
                                                          qryUpdate.ExecSql;
                                                     Except
                                                       on E: Exception do
                                                        begin
                                                             memArquivo.Lines.Add('--> Erro ao tentar atualizar o(s) registro(s) na tabela Planilha.  Nº do Recebimento:' + Trim(Excel.Cells.Item[ilinha,1].text) + ' Erro: '+ E.Message );
                                                        end;
                                                     end;

                                                     //Lamcamento...................................................................
                                                     qryUpdate.Close;
                                                     qryUpdate.SQL.Text:= 'delete from Lamcamento where PLNCODIGO = ' + IntToStr(iPLNCODIGO);
                                                     try
                                                          qryUpdate.ExecSql;
                                                     Except
                                                       on E: Exception do
                                                        begin
                                                             memArquivo.Lines.Add('--> Erro ao excluir o(s) registro(s) na tabela Rateiodocum.  Nº do Recebimento:' + Trim(Excel.Cells.Item[ilinha,1].text) + ' Erro: '+ E.Message );
                                                        end;
                                                     end;

                                                     //documento....................................................................
                                                     qryUpdate.Close;
                                                     qryUpdate.SQL.Text:= 'delete from documento where CODDOCUMENTO = ' + QryVerificacao.FieldByName('CODDOCUMENTO').AsString;
                                                     try
                                                          qryUpdate.ExecSql;
                                                     Except
                                                       on E: Exception do
                                                        begin
                                                             memArquivo.Lines.Add('--> Erro ao excluir o(s) registro(s) na tabela Documento.  Nº do Recebimento:' + Trim(Excel.Cells.Item[ilinha,1].text) + ' Erro: '+ E.Message );
                                                        end;
                                                     end;

                                               end;
                                //SIG101465 - Fim
                                               sSqlAux := '';
                                               qryUpdate.Close;
                                               sSqlAux := ' delete Hstcontribprev ';
                                               sSqlAux := sSqlAux + ' where FLGCALCRESERVA = 0';
                                               sSqlAux := sSqlAux + ' and NUMRECEBIMENTO = ' + sNumRecebimento;
                                               qryUpdate.SQL.Text:= sSqlAux;
                                               try //SIG 99710
                                                   qryUpdate.ExecSql;
                                                   memArquivo.Lines.Add('--> Nº do Recebimento Excluido: ' + Trim(Excel.Cells.Item[ilinha,1].text));
                                               Except //SIG 99710
                                                 on E: Exception do     //SIG 99710
                                                 begin //SIG 99710
                                                   memArquivo.Lines.Add('--> Erro ao excluir o Nº do Recebimento: ' + Trim(Excel.Cells.Item[ilinha,1].text) + ' Erro: '+ E.Message ); //SIG 99710
                                                 end; //SIG 99710
                                               end; //SIG 99710

                                          end;
                                end
                                else
                                begin
                                     memArquivo.Lines.Add('--> Nº do Recebimento não localizado: ' + Trim(Excel.Cells.Item[ilinha,1].text));
                                end;

                          end;
                          iLinha := iLinha + 1;
                    end
                    else
                        bSair := False;
            end;
      end;


      if RgTipoOperacao.ItemIndex = 0 then
        GravaLogTotalPrev('Alteração de Contribuição em lote')
      else if RgTipoOperacao.ItemIndex = 1 then
        GravaLogTotalPrev('Exclusão de Contribuição em lote');

      dtmBaseDados.dbBaseDados.Commit;
      memArquivo.Lines.Add('Processo finalizado! ' + 'Total de linhas Processadas: ' + IntToStr(iLinha-2));
      Excel.Quit;
      Excel := Unassigned;
      //btnLimpaArquivo.Click;

  Except
       dtmBaseDados.dbBaseDados.Rollback;
       Excel.Quit;
       Excel := Unassigned;
       btnLimpaArquivo.Click;
  end;

end;

procedure TFrmAlteracaoHistoricoContrib.FazerRefresh;
begin
  qry.close;
  qry.open;
end;

procedure TFrmAlteracaoHistoricoContrib.FormShow(Sender: TObject);
begin
  inherited;
  RgTipoOperacao.ItemIndex := 0;
  bbtnConfirmar.Caption    := '&Atualizar';

  //Ewerton Beltramini - SIG101465 - 18/08/2021 - Inicio..................................................
  QryImpAux.Close;
  QryImpAux.Sql.Clear;
  QryImpAux.Sql.add('SELECT IDUSUARIO, IDGRUPO FROM GRUPOUSU');
  QryImpAux.Sql.add(' WHERE IDGRUPO in (822,1035) ');
  QryImpAux.Sql.add('   AND IDUSUARIO = ' + IntToStr(Sistema.IdUsuario));
  QryImpAux.Open;

  if QryImpAux.FieldByName('IDUSUARIO').AsString = IntToStr(Sistema.IdUsuario) then
  begin
      chkContribuicaoAlimentada.State:= cbChecked;
      chkContribuicaoAlimentada.Enabled:= True;   
  end
  else
  begin
      chkContribuicaoAlimentada.State:= cbUnchecked;
      chkContribuicaoAlimentada.Enabled:= False;
  end;
  //Ewerton Beltramini - SIG101465 - 18/08/2021 - Fim.....................................................    

end;

procedure TFrmAlteracaoHistoricoContrib.RgTipoOperacaoClick(
  Sender: TObject);
begin
  inherited;
    if RgTipoOperacao.ItemIndex = 0 then
       bbtnConfirmar.Caption    := '&Atualizar'
    else if RgTipoOperacao.ItemIndex = 1 then
       bbtnConfirmar.Caption    := '&Excluir';

       Application.ProcessMessages;

end;

procedure TFrmAlteracaoHistoricoContrib.btnModeloClick(Sender: TObject);
var excel :variant;
begin
  inherited;
      Excel := CreateOleObject('Excel.Application');
      Excel.Visible := True;
      //Excel.WorkBooks.Add('\\altarf\#altarf\GETIF_PUBLICO\COARI\Modelos\Alteracao Historico Contribuicao em Lote.xlsx');               // Andre Imakawa - WO8381
      //Excel.WorkBooks.Add('\\Funcef.com.br\arquivos\Planus\Documentos\COARI\Modelos\Alteracao Historico Contribuicao em Lote.xlsx');  // Andre Imakawa - WO8381
      Excel.WorkBooks.Add('\\Funcef.com.br\arquivos\PLANUS_COARI\Modelos\Alteracao Historico Contribuicao em Lote.xlsx');  // Andre Imakawa - WO9432
end;



end.
