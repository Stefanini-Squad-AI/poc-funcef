// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Ádler Souza
// Data        : 25/10/2010
// Pendência   : SOL 146435 KINTANA 996974
// Descrição   : Ajuste na Query que traz os participantes com FLGDESATIVADO a 0.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/10/2006
// Pendência   : 23455
// Descrição   : Acerto para gravar nome da patrocinadora no campo EMPRESA.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 21/12/2005
// Pendência   : 21084
// Descrição   : O acerto realizado na qrydet, pela pendência 20376 fez com que
//               os registros de empresas sem ser patrocinadoras não aparecessem
//               no grid. Foi colocado outer join com a Elegpatro para resolver.
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 03/10/2005
// Pendência   : 20376
// Descrição   : acerto da qeydet incluindo a cláusula   AND (EL.IDPESSJUR       = HF.IDPESSJUR).
//               o dataset bestava fazendo um produto pelo númerod e patrocinadoras na ELEGPATRO.
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 22/02/2005
// Pendência   : 18665
// Descrição   : Acerto de todos os erros da tela encontrados na tela.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 02/02/2005
// Pendência   : 18609
// Descrição   : Acerto no erro ao confirmar
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 07/12/2004
// Descrição   : acerto na atribuição do sequencial
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 06/12/2004
// Descrição   : acerto do tab order, coloquei o combo de vínculo empregatício para procura automática,
//               tirei a marcação de "sensível a caixa" do campo matrícula no monstaselect
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 19/01/2004
// Rotina      : qryDetAfterScroll e dbchkFlgContaTSClick
// Pendência   : 15939
// Descrição   : Incluído campo novo na HISTFUNCPREV (FLGTEMPOMANUT) e inclusão
//               de rotinas de apoio.
//------------------------------------------------------------------------------
// Autor(a)    : André Tavares
// Pendência   : 15567
// Data        : 13.12.2003
// Alteração   : estava pegando o tempo errado
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
//  Rotina     : sbtnInserirClick
//  Autor      : Gleyber
//  Data       : 12/06/2003
//  Descrição  : Forçar a marcação do FLGCONTATS
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 13/02/2003
//  Descrição  : Reinclusão dos blocos de codigo que mostram os resultados
//               totais dos calculos de TS.
//------------------------------------------------------------------------------
//  Autor      : Carlos Gleyber Macedo de Mesquita
//  Data       : 04.05.2002
//  Descrição  : Tela refeita para ficar no padrão CM - Pendência 6417
//------------------------------------------------------------------------------
{ Augusto 11/10/2002 - Funções de Calculo dos tempos de contribuiçao agora estão }
{                      localizadas nas units do componente ConsPart (uConsPart)  }
unit FCadHistFuncPartCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, wwdbdatetimepicker, CMDateTimePicker, Mask, StdCtrls,
  CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, Wwdotdot, Wwdbcomb, wwdbedit, DBCtrls, URegra{$IFNDEF VERSAO0505 }, UCMTypes {$ENDIF} ;

type
  TValTot  = array[1..100]  of String[08];
  TValUnit = array[1..100]  of String[08];

type
// Tipos usados
  TTipoProcesso=(TpBatch, TpUnitario);

  TfrmCadHistFuncPartCS = class(TfrmCadMestreDetalheCS)
    Label3: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edParticipante: TEdit;
    edMatricula: TEdit;
    dtAdmissao: TCMDateTimePicker;
    qryDet: TwwQuery;
    UpdDet: TUpdateSQL;
    edDocumento: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    rgrpTipoEmpresa: TRadioGroup;
    dblkpcmbPatro: TwwDBLookupCombo;
    lblEmpresa: TLabel;
    dbedDataFinal: TwwDBDateTimePicker;
    qryAux: TwwQuery;
    dbedDataInicio: TwwDBDateTimePicker;
    qryPatroFund: TwwQuery;
    dbedCargo: TwwDBEdit;
    dbedValor: TwwDBEdit;
    dbedMatricula: TwwDBEdit;
    Label4: TLabel;
    Label17: TLabel;
    label5: TLabel;
    qryTpInsalubri: TwwQuery;
    dblkpcmbCodTpInsalubri: TwwDBLookupCombo;
    Label6: TLabel;
    dbedFuncao: TwwDBEdit;
    Label10: TLabel;
    dbcbVincEmp: TwwDBComboBox;
    Label16: TLabel;
    Label7: TLabel;
    dblkpcmbIdDocumento: TwwDBLookupCombo;
    qryTipoDocPessoa: TwwQuery;
    dbedNumDocumento: TwwDBEdit;
    Label9: TLabel;
    Label18: TLabel;
    dbchkFlgContaTS: TDBCheckBox;
    qryRegra: TwwQuery;
    qryAux2: TwwQuery;
    qryAux3: TwwQuery;
    qryDetIDPESSOA: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetSEQHISTFUNC: TFloatField;
    qryDetIDDOCUMENTO: TFloatField;
    qryDetCODTPINSALUBRI: TStringField;
    qryDetFLGCONTATS: TFloatField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFINAL: TDateTimeField;
    qryDetCARGO: TStringField;
    qryDetVALORCARGO: TFloatField;
    qryDetFUNCAO: TStringField;
    qryDetVINCEMPREG: TStringField;
    qryDetMATRICULA: TStringField;
    qryDetEMPRESA: TStringField;
    qryDetTEMPOCALC: TFloatField;
    qryDetTEMPOCALCINSALUB: TFloatField;
    qryDetFLGCONCOMITANTE: TFloatField;
    qryDetFATOR: TFloatField;
    qryDetTEMPOSERVANTERIOR: TFloatField;
    qryDetTEMPOSITESPECIAL: TFloatField;
    qryDetTEMPONAOCREDITADO: TFloatField;
    qryDetNOME: TStringField;
    dbedEmpresa: TwwDBEdit;
    dbedSeqHistFunc: TwwDBEdit;
    qryDetTempoSer: TIntegerField;
    qryDetTemposeresp: TIntegerField;
    qryDetTemposernaocred: TIntegerField;
    qryDetChkConc: TBooleanField;
    MontaSelectPart: TMontaSelect;
    qryDetNUMDOCUMENTO: TStringField;
    Label11: TLabel;
    Label12: TLabel;
    PnlTempoTotal: TPanel;
    Label13: TLabel;
    PnlTempoINSS: TPanel;
    PnlTempoSC: TPanel;
    qryDetTEMPOSERVEXTENSO: TStringField;
    qryDetTEMPOSIMPLES: TFloatField;
    dbchkFlgTempoManut: TDBCheckBox;
    qryDetFLGTEMPOMANUT: TFloatField;
    qryDetPROXSEQHISTFUNC: TFloatField;
    qryDetNOMEDOCUMENTO: TStringField;
    qryDetDESCRICAO: TStringField;
    qryDetVINCEMPREGATICIO: TStringField;
    qryDetTEMPODEMONS: TIntegerField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure dbedDataFinalExit(Sender: TObject);
    procedure rgrpTipoEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dblkpcmbIdDocumentoChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure dbchkFlgContaTSClick(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblkpcmbPatroExit(Sender: TObject);
  private
    { Private declarations }
    wValTot,wValUnit : TValTot;
    sIdPessoa, sIdPessJur, sSeqHistFunc, sSql, sCodTip, sIdDoc : string;
    iYear, iMonth, iDay : Word;
    sNomeStep, sValorStep, sNomeValorStep, wData, wDataMin, wDataMax, wDataAnt, WDataPos : string;
    dTempoDecorrido: double;
    sTipo, wAnos, wMeses, wDias, wAnos1, wMeses1, wDias1, wanomesdia,wanomesdia1,wanomesdia2, numanos, nummeses, numdias, wTotanomesdia : string;
    dTempoDecorridoi,dTempoemMeses,dTempoDecorridot,dTempoCalculado,dTempoCalculadois,wanoini, wanofim, numlinhas, I, wValInter,wValAtual,wValResult, wCont : integer;
    bEditaDet,   
    sCalc      : Boolean;
    iTempoSimples : Integer;


    procedure CarregaDados;
    procedure HabilitaBotoes(bHabilita: Boolean);

    procedure CalcAnoMesDia;
    procedure LimpaTela;
  public
    { Public declarations }
    wIdDocumento :Integer;
    wNumDocumento:String;

// Retorna proximo Sequencial da Pessoa
    Function ProxSequencial(QryLocal: TwwQuery;
                            IdPessoa: Integer):Integer;

// Repete Um Texto "n" Neves
  Function Replicate            (Texto:String;NVezes:Integer):String;

  end;

var
  iProxSeq : integer;
  frmCadHistFuncPartCS: TfrmCadHistFuncPartCS;

implementation

uses
   UMensErro, UAdmPrev, UDataBase, UFuncoesUteis, uDiasUteis,
   FInformaData, uConsPart, Usistema;

{$R *.DFM}


procedure TfrmCadHistFuncPartCS.CarregaDados;
Var
  RecTempo : TRecTempo;
begin
// Busca Dados do Funcionário
  QryAux.Close;
  QryAux.Sql.Clear;
  QryAux.Sql.Add(
    ' SELECT P.NUMDOCUMENTO, P.IDPESSOA, P.NOME, EL.MATRICULA, EL.DATAADMISSAO, EL.IDPESSJUR ' +
		 ' FROM PESSOA P, ELEGPATRO EL ' +
		 ' WHERE P.TIPO         = ' + '''F''' + ' AND ' +
		 '       EL.IDPESSOA    = ' +sIdPessoa+
		 '       AND P.IDPESSOA = EL.IDPESSOA'); // (+) Retirado
  QryAux.Open;

// Caso Não esteja vazio, Mostra dados
  if not qryAux.IsEmpty then begin
    edMatricula.Text    := qryAux.FieldByName('MATRICULA').AsString;
    dtAdmissao.Text     := qryAux.FieldByName('DATAADMISSAO').AsString;
    sIdPessJur          := qryAux.FieldByName('IDPESSJUR').AsString;
    edDocumento.Text    := qryAux.FieldByName('NUMDOCUMENTO').AsString;
    edParticipante.Text := qryAux.FieldByName('NOME').AsString;
  end;

// Busca outros Dados
  if not qryDet.IsEmpty then begin

// Busca Outros Dados

    if trim(qryDet.FieldByName('IDDOCUMENTO').AsString) <> '' // Gleyber - 12/07/2002
     Then
      Begin
       sSql := 'SELECT IDDOCUMENTO, NOMEDOCUMENTO FROM TIPODOCPESSOA ' +
                  'WHERE  IDDOCUMENTO = '+qryDet.FieldByName('IDDOCUMENTO').AsString;

       qryAux.Close;
       qryAux.Sql.Clear;
       qryAux.Sql.Add(sSql);
       qryAux.Open;

       dblkpcmbIdDocumento.Text      := qryAux.fieldbyname('NOMEDOCUMENTO').asstring;
      End;
  end;

  
  If qryDet.IsEmpty Then
  Begin
    RecTempo.TempoSimples := 0;
    RecTempo.TempoTotal   := 0;
    PnlTempoTotal.Caption := IntToStr(RecTempo.TempoSimples);
    PnlTempoINSS.Caption  := ' INSS - '+TempoExtenso(RecTempo.TempoTotal);
    PnlTempoSC.Caption    := ' S/C  - '+TempoExtenso(RecTempo.TempoSimples);
  End
  Else
  Begin
  

  
// Mostra tempo total do Funcionario e Hint com o extenso do tempo
    RecTempo  := BuscaTempoContrib(QryAux, StrToInt(sIdPessJur),
                                           StrToInt(sIdPessoa));
    PnlTempoTotal.Caption:=IntToStr(RecTempo.TempoSimples);
    PnlTempoINSS.Caption := ' INSS - '+TempoExtenso(RecTempo.TempoTotal);
    PnlTempoSC.Caption   := ' S/C  - '+TempoExtenso(RecTempo.TempoSimples);
  End;
end;

procedure TfrmCadHistFuncPartCS.CmeCadastroFind(Sender: TObject);
begin
  LimpaTela; 

  sIdPessoa           := '';
  sIdPessJur          := '';

  inherited;

// Caso tenha selecionado algum dado
  if (MontaSelect.RetornouValor) then begin

// Abre query principal apenas para constar
      qry.Close;
      qry.Open;

//  Mostra dados do Mestre
      edDocumento.Text       := MontaSelect.ValoresChave[2];
      edParticipante.Text    := MontaSelect.ValoresChave[1];
      sIdPessoa              := MontaSelect.ValoresChave[0];
      sIdPessJur             := MontaSelect.ValoresChave[3];

//  Abre query Detalhe e complementa dados
      QryDet.Close;
      QryDet.ParamByName('pIDPESSOA').AsString := MontaSelect.ValoresChave[0];
      QryDet.Open;

// Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
      ProcessaHistContrib(qryAux,
                          StrToInt(sIdPessoa),
                          DateToStr(Date));

// Carrega os Dados no Funcionário
      CarregaDados;

  end;


  sbtnAlterar.Enabled :=True;
  sbtnApagar.Enabled  :=True;
  sbtnInserir.Enabled :=True;
  pnlFundo.Enabled    :=True;

end;

procedure TfrmCadHistFuncPartCS.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dbchkFlgContaTS.Checked       := True;
end;

procedure TfrmCadHistFuncPartCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (qryDet.State in [dsInactive]) or (qryDet.IsEmpty)
  then Exit;

  wCont := 0;

  if Trim(qryDet.FieldByName('IDPESSJUR').AsString) = '' then begin
    rgrpTipoEmpresa.ItemIndex :=1;
    dblkpcmbPatro.Visible  := False;
    dbedEmpresa.Visible    := True;
    lblEmpresa.Caption     := 'Empresa';
  end else begin
    rgrpTipoEmpresa.ItemIndex :=0;
    dblkpcmbPatro.Visible  := True;
    dblkpcmbPatro.PerformSearch;
    dbedEmpresa.Visible    := False;
    lblEmpresa.Caption     := 'Patrocinadora';
    dbedEmpresa.Update;
  end;
end;

procedure TfrmCadHistFuncPartCS.dbedDataFinalExit(Sender: TObject);
begin
  inherited;
  if Trim(dbedDataInicio.Text) = '' then Exit;

  if ds.DataSet.State in [dsEdit] then begin
    if Trim(dbedDataFinal.Text) = '' then Exit;

    if Trim(dblkpcmbCodTpInsalubri.Text) = '' then Exit;

    if StrToDate(dbedDataFinal.Text) < StrToDate(dbedDataInicio.Text) then begin
      MsgDlg('A Data Final deve ser maior que a Data de Início.','Erro',mtError,[mbOk,mbHelp],0);
      dbedDataFinal.Text := '';
      dbedDataFinal.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmCadHistFuncPartCS.rgrpTipoEmpresaClick(Sender: TObject);
begin
  inherited;
  if rgrpTipoEmpresa.ItemIndex = 1 then begin
     dblkpcmbPatro.Visible  := False;
     dbedEmpresa.Visible    := True;
     lblEmpresa.Caption     := 'Empresa';

     
     dblkpcmbPatro.TabOrder := 14;
     dbedEmpresa.TabOrder   := 3;
     

     If QryDet.State in [dsInsert, dsEdit] then dblkpcmbPatro.Clear;
  end else begin
     dblkpcmbPatro.Visible  := True;
     dbedEmpresa.Visible    := False;
     lblEmpresa.Caption     := 'Patrocinadora';

     
     dblkpcmbPatro.TabOrder := 3;
     dbedEmpresa.TabOrder   := 14;
     

     If QryDet.State in [dsInsert, dsEdit] then dbedEmpresa.Clear;
  end;
end;

procedure TfrmCadHistFuncPartCS.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, iYear, iMonth, iDay);
  wData  := ColocaZeros(inttostr(iDay),2)+ColocaZeros(inttostr(iMonth),2)+inttostr(iYear);
  wData  := ColocaBarra(wData);

// Guarda dados que serão informados automaticamente
  wIdDocumento  := 0;
  wNumDocumento := '';

  qryDet.Close;
  qryDet.ParamByName('pIdPessoa').Value     := 0;
  qryDet.Open;

  qryTpInsalubri.Close;   qryTpInsalubri.Open;
  qryTipoDocPessoa.Close; qryTipoDocPessoa.Open;

  dbchkFlgContaTS.Checked   := True;
  dbcbVincEmp.Text := '';
  wDataMax := '01/01/1000';
  wDataMin := '31/12/5000';

  qryPatroFund.Close;
  qryPatroFund.ParamByName('IdFundacao').AsInteger := iIdFundacao;
  qryPatroFund.Open;

  sbtnInserir.Enabled :=True;
  pnlFundo.Enabled    :=True;

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 21.06.2003
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 21.06.2003

end;

procedure TfrmCadHistFuncPartCS.CalcAnoMesDia;
begin
  if length(wanomesdia) < 7 then begin
    numanos  := copy(wanomesdia,1,2);
    nummeses := copy(wanomesdia,3,2);
    numdias  := copy(wanomesdia,5,2);

    if length(wanomesdia) = 5 then begin
	  
   	 numanos  := copy(wanomesdia,1,1);
	     nummeses := copy(wanomesdia,2,2);
	     numdias  := copy(wanomesdia,4,2);
    end;

    if length(wanomesdia) = 4 then begin
	  
  	   numanos  := '00';
	     nummeses := copy(wanomesdia,1,2);
	     numdias  := copy(wanomesdia,3,2);
    end;

    if length(wanomesdia) = 3 then begin
	  
	     numanos  := '00';
	     nummeses := copy(wanomesdia,1,1);
	     numdias  := copy(wanomesdia,2,2);
    end;

    if length(wanomesdia) = 2 then begin
	  
	     numanos  := '00';
	     nummeses := '00';
	     numdias  := copy(wanomesdia,1,2);

	     if ( RetornaAnoMes(strtodate(dbedDataInicio.Text)) = RetornaAnoMes(strtodate(dbedDataFinal.Text)) ) then
	       if ( copy(dbedDataInicio.Text,4,2) = '02') and ( copy(dbedDataFinal.Text,4,2) = '02')  then
		       if AnoBissexto(strtoint(copy(dbedDataInicio.Text,7,4))) then begin

		         if  numdias = '28' then numdias := inttostr(strtoint(numdias) + 2);
    		   end
		     else if  numdias = '27' then
   		   numdias := inttostr(strtoint(numdias) + 3);
    end;

    if length(wanomesdia) = 1 then begin
	  
	     numanos  := '0';
	     nummeses := '0';
	     numdias  := copy(wanomesdia,1,1);
    end;

  end else begin
    numanos  := copy(wanomesdia,1,3);
    nummeses := copy(wanomesdia,4,2);
    numdias  := copy(wanomesdia,6,2);
  end;

  if strtoint(numdias) > 69 then begin
    numdias  := inttostr(strtoint(numdias) - 70 + 1);
    if strtoint(numdias) > 29 then begin
	     numdias  := '00';
	     nummeses := inttostr(strtoint(nummeses) + 1);
    end;
  end;

  if strtoint(nummeses) > 80 then begin
    nummeses := inttostr(strtoint(nummeses) - 88);
    if strtoint(nummeses) > 11 then begin
	     nummeses := '00';
	     numanos  := inttostr(strtoint(numanos) + 1);
    end;
  end;

end;


// Repete Um Texto "n" Neves
function TfrmCadHistFuncPartCS.Replicate(Texto: String;
  NVezes: Integer): String;
Var
  I:Integer;
Begin
// Critica Dados Enviados
  If (Texto = '') Or (NVezes <=0) Then Begin
    Result:=''; // Resultado
    Exit;
  End;
  Result:='';
// Repete a String N Vezes
  For I:= 1 To nVezes Do Begin
    Result:=Result + Texto
  End;
End;





// Retorna o Proximo Sequencial da Pessoa
Function  TFrmCadHistFuncPartCS.ProxSequencial(QryLocal: TwwQuery;
                                               IdPessoa: Integer):Integer;
Begin
  Result := 1;
// Busca o Proximo Sequencial da Pessoa
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT MAX(SEQHISTFUNC) + 1 AS PROXIMOSEQHISTFUNC ' +
            ' FROM HISTFUNCPREV                                 ' +
            ' WHERE IDPESSOA = ' + IntToStr(IdPessoa) );
	   Open;
// Caso Maior que zero retorna o numero
	   If (FieldByName('PROXIMOSEQHISTFUNC').AsInteger >= 1) Then Begin
	     Result := FieldByName('PROXIMOSEQHISTFUNC').AsInteger;
    End;
  End;
End;

procedure TfrmCadHistFuncPartCS.CmeDetalheInsert(Sender: TObject);
Var
  wIdPessoa, wIdPessJur :String;
begin
  inherited;

  If CmeCadastro.Operacao = opInserir
   Then sIdPessoa := MontaSelectPart.ValoresChave[0]
   Else sIdPessoa := MontaSelect.ValoresChave[0];

  dbedDataInicio.SetFocus;


  dbchkFlgContaTS.Checked       := True;

  wIdPessoa := sIdPessoa;
  wIdPessJur:= sIdPessJur;

  sTipo := 'INCLUSAO';
  Label18.Caption := ' Total :';
  sIdPessoa :=wIdPessoa;
  sIdPessJur:=wIdPessJur;

  dbedDataInicio.SetFocus;

// Preenche Dados Default
  QryDet.FieldByName('FLGCONTATS').AsString := '1';
// Preenche dados informados automaticamente
  QryDet.FieldByName('IDDOCUMENTO').AsInteger:=wIdDocumento;
  QryDet.FieldByName('NUMDOCUMENTO').AsString:=wNumDocumento;
  rgrpTipoEmpresa.Itemindex := 1;
end;

procedure TfrmCadHistFuncPartCS.sbtnInserirClick(Sender: TObject);
begin
  LimpaTela; 

  MontaSelectPart.Executar;

  
  if (MontaSelectPart.RetornouValor = True) then begin
    sIdPessoa            := MontaSelectPart.ValoresChave[0];
    edParticipante.Text  := MontaSelectPart.ValoresChave[1];
    edDocumento.Text     := MontaSelectPart.ValoresChave[2];
    edMatricula.Text     := MontaSelectPart.ValoresChave[3];
    dtAdmissao.Text      := MontaSelectPart.ValoresChave[4];
    sIdPessJur           := MontaSelectPart.ValoresChave[5];
    dbedDataInicio.SetFocus;
    
    QryDet.Close;
    QryDet.ParamByName('pIDPESSOA').AsString := sIdPessoa;
    QryDet.Open;
    qry.Open;

    dbchkFlgContaTS.Checked; 
    inherited;
  end
  Else
    bbtnCancelar.Enabled := True;
  
end;

procedure TfrmCadHistFuncPartCS.qryDetAfterScroll(DataSet: TDataSet);
Var
  iTempoLocal : Integer;
begin
  inherited;
  if (qryDet.State in [dsInactive]) or (qryDet.IsEmpty)
  then Exit;

  
  If qryDet.FieldByName('FLGCONTATS').AsInteger = 1
   Then dbchkFlgTempoManut.Enabled := True
   Else dbchkFlgTempoManut.Enabled := False;
  

  wCont := 0;

    sIdPessoa := QryDet.FieldByName('IDPESSOA').AsString;

  if Trim(qryDet.FieldByName('IDPESSJUR').AsString) = '' then begin
    rgrpTipoEmpresa.ItemIndex :=1;
    dblkpcmbPatro.Visible  := False;
    dbedEmpresa.Visible    := True;
    lblEmpresa.Caption     := 'Empresa';
  end else begin
    rgrpTipoEmpresa.ItemIndex :=0;
    dblkpcmbPatro.Visible  := True;
    dblkpcmbPatro.PerformSearch;
    dbedEmpresa.Visible    := False;
    lblEmpresa.Caption     := 'Patrocinadora';
    dbedEmpresa.Update;
  end;


// Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
  If Not (QryDet.State in [dsInsert]) Then Begin
    iTempoLocal := CalcTempoContrib(QryDet,
                   QryDet.FieldByName('IDPESSOA').AsInteger,
                   QryDet.FieldByName('SEQHISTFUNC').AsInteger,
                   QryDet.FieldByName('FLGCONTATS').AsInteger,
                   1, // Calculo Normal
                   QryDet.FieldByName('DATAINICIO').AsString,
                   QryDet.FieldByName('DATAFINAL').AsString,
                   DateToStr(Date));
    Label18.Caption := 'Tempo .: '+TempoExtenso(iTempoLocal);
  End;

end;                       

procedure TfrmCadHistFuncPartCS.sbtnExcluiDetClick(Sender: TObject);
Var
  RecTempo : TRecTempo;
begin
  inherited;

// Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
  ProcessaHistContrib(QryAux,
                      StrToInt(sIdPessoa), DateToStr(Date));
  
// Mostra tempo total do Funcionario e Hint com o extenso do tempo
  RecTempo  := BuscaTempoContrib(QryAux, StrToInt(sIdPessJur),
                                         StrToInt(sIdPessoa));


  PnlTempoTotal.Caption:=IntToStr(RecTempo.TempoSimples);
  PnlTempoINSS.Caption := ' INSS - '+TempoExtenso(RecTempo.TempoTotal);
  PnlTempoSC.Caption   := ' S/C  - '+TempoExtenso(RecTempo.TempoSimples);
end;

procedure TfrmCadHistFuncPartCS.dblkpcmbIdDocumentoChange(Sender: TObject);
begin
  inherited;
  if (sIdPessoa <> '') and (Trim(dblkpcmbIdDocumento.Text) = 'CPF') then begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' SELECT NUMDOCUMENTO FROM PESSOA ' +
     		   ' WHERE IDPESSOA = ' + sIdPessoa);
    qryAux.Open;
    if ds.DataSet.State in [dsInsert] then
       qryDet.FieldByName('NUMDOCUMENTO').AsString := qryAux.FieldByName('NUMDOCUMENTO').AsString;
  End Else Begin
    if ds.DataSet.State in [dsInsert] then
       qryDet.FieldByName('NUMDOCUMENTO').AsString := '';
  end;
end;

procedure TfrmCadHistFuncPartCS.bbtnOkDetClick(Sender: TObject);
Var
  wDataFinal:String;
begin
  sCalc := True;
// Caso a Data de Final esteja vazia processa como Atual
  if Trim(dbedDataFinal.Text) = '' then begin
    wDataFinal := DateToStr(Date);
  end else begin
// Guarda Data Final
    wDataFinal := dbedDataFinal.Text;

    if StrToDate(dbedDataFinal.Text) < StrToDate(dbedDataInicio.Text) then begin
    	 MsgDlg('A Data Final deve ser maior que a Data de Início.','Erro',mtError,[mbOk,mbHelp],0);
	     dbedDataFinal.Text := '';
	     dbedDataFinal.SetFocus;
	     Exit;
    end;

  end;

  if Trim(dbedDataInicio.Text) = '' then begin
    MsgDlg('Data Inicio não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbedDataInicio.SetFocus;
    Exit;
  end;

// Guarda o Nome da Patrocinadora com Historico, caso seja Patrocinadora
  QryDet.FieldByName('IDPESSOA').AsString       := sIdPessoa;

  qryDet.FieldByName('NOMEDOCUMENTO').AsString    := dblkpcmbIdDocumento.Text;
  qryDet.FieldByName('VINCEMPREGATICIO').AsString := dbcbVincEmp.Text;

  If Trim(QryDet.FieldByName('EMPRESA').AsString) = '' Then Begin
    QryDet.FieldByName('EMPRESA').AsString:= dblkpcmbPatro.Text;
  End;

  qryDet.FieldByName('NUMDOCUMENTO').AsString     := dbedNumDocumento.Text;

//------------------------------------------------------------------------------
//  Testa se Tempo é Concomitante
  If PeriodoConcomitante(QryAux,
                         StrtoInt(sIdPEssoa),
                         QryDet.FieldByName('SEQHISTFUNC').AsInteger,
                         DbedDataInicio.Text,
                         DbedDataFinal.Text)
  Then Begin
    QryDet.FieldByName('FLGCONCOMITANTE').AsInteger := 1;
  End Else Begin
    QryDet.FieldByName('FLGCONCOMITANTE').AsInteger := 0;
  End;


// Guarda dados que serão informados automaticamente
  wIdDocumento  := QryDet.FieldByName('IDDOCUMENTO').AsInteger;
  wNumDocumento := QryDet.FieldByName('NUMDOCUMENTO').AsString;

  If rgrpTipoEmpresa.ItemIndex = 1 Then
    qryDetIDPESSJUR.AsString := '';

  // Tirar campos nulos
  if Trim(dblkpcmbIdDocumento.Text) = ''    then qryDetIDDOCUMENTO.AsString    := '';
  if Trim(dblkpcmbCodTpInsalubri.Text) = '' then qryDetCODTPINSALUBRI.AsString := '';

  
  If qryDet.State = dsEdit Then
    bEditaDet := True;

  QryDet.FieldByName('TEMPOSERVEXTENSO').AsString := TempoExtenso(QryDet.FieldByName('TEMPOSIMPLES').AsInteger);
  QryDet.FieldByName('TEMPODEMONS').AsInteger     := QryDet.FieldByName('TEMPOSIMPLES').AsInteger;
  

// Heranca
  inherited;

  inc(iProxSeq);

  If Not bEditaDet Then 
  Begin
    QryDet.FieldByName('SEQHISTFUNC').AsInteger     := iProxSeq  ;
    qrydet.fieldbyname('PROXSEQHISTFUNC').AsInteger := iProxSeq  ; 
    QryDet.FieldByName('IDDOCUMENTO').Clear;
    QryDet.FieldByName('NUMDOCUMENTO').AsString     := '';
    
  End
  Else
    HabilitaBotoes(True);

  bEditaDet := False; 
end;

procedure TfrmCadHistFuncPartCS.CmeCadastroConfirma(Sender: TObject);
begin
   CmeDetalhe.Confirma(Self);
   FazerVoltarDet;

   tb97Detalhe.Visible := false;

   AplicaAlteracoes([TDBDataSet(dsDet.DataSet)]);

    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


   if grdAtual <> nil then grdAtual.BringToFront;

   CmeDetalhe.Atualizabotoes(Self);

   CmeCadastroFind(Self);
end;

procedure TfrmCadHistFuncPartCS.bbtnConfirmarClick(Sender: TObject);
Var
  RecTempo : TRecTempo;
begin
  CmeCadastro.RepetirInsert := False; 
  inherited;

  If Trim(sIdPessoa) = '' Then Exit;

// Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
  ProcessaHistContrib(QryAux,
                      StrToInt(sIdPessoa),
                      DateToStr(Date));

  If qryDet.IsEmpty Then
  Begin
    RecTempo.TempoSimples := 0;
    RecTempo.TempoTotal   := 0;
    PnlTempoTotal.Caption := IntToStr(RecTempo.TempoSimples);
    PnlTempoINSS.Caption  := ' INSS - '+TempoExtenso(RecTempo.TempoTotal);
    PnlTempoSC.Caption    := ' S/C  - '+TempoExtenso(RecTempo.TempoSimples);
  End
  Else
  Begin
  

  
// Mostra tempo total do Funcionario e Hint com o extenso do tempo
    RecTempo  := BuscaTempoContrib(QryAux, StrToInt(sIdPessJur),
                                   StrToInt(sIdPessoa));

    PnlTempoTotal.Caption:=IntToStr(RecTempo.TempoSimples);
    PnlTempoINSS.Caption := ' INSS - '+TempoExtenso(RecTempo.TempoTotal);
    PnlTempoSC.Caption   := ' S/C  - '+TempoExtenso(RecTempo.TempoSimples);
  End;
end;

procedure TfrmCadHistFuncPartCS.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if Trim(qryDet.FieldByName('IDPESSJUR').AsString) = '' then begin
    rgrpTipoEmpresa.ItemIndex :=1;
    dblkpcmbPatro.Visible  := False;
    dbedEmpresa.Visible    := True;
    lblEmpresa.Caption     := 'Empresa';
  end else begin
    rgrpTipoEmpresa.ItemIndex :=0;
    dblkpcmbPatro.Visible  := True;
    dblkpcmbPatro.PerformSearch;
    dbedEmpresa.Visible    := False;
    lblEmpresa.Caption     := 'Patrocinadora';
    dbedEmpresa.Update;
  end;
end;

procedure TfrmCadHistFuncPartCS.qryDetCalcFields(DataSet: TDataSet);
begin
  inherited;
  
  If Not (QryDet.State in [dsInsert]) Then Begin
    iTempoSimples := CalcTempoContrib(qryAux,
                               QryDet.FieldByName('IDPESSOA').AsInteger,
                               QryDet.FieldByName('SEQHISTFUNC').AsInteger,
                               QryDet.FieldByName('FLGCONTATS').AsInteger,
                               1, // Calculo Normal
                               QryDet.FieldByName('DATAINICIO').AsString,
                               QryDet.FieldByName('DATAFINAL').AsString,
                               DateToStr(Date));
    QryDet.FieldByName('TEMPOSERVEXTENSO').AsString := TempoExtenso(iTempoSimples);
    QryDet.FieldByName('TEMPODEMONS').AsInteger := iTempoSimples;
    Exit;
  End;


  QryDet.FieldByName('TEMPOSERVEXTENSO').AsString := TempoExtenso(QryDet.FieldByName('TEMPOSIMPLES').AsInteger);
  QryDet.FieldByName('TEMPODEMONS').AsInteger := QryDet.FieldByName('TEMPOSIMPLES').AsInteger;

end;

procedure TfrmCadHistFuncPartCS.dbchkFlgContaTSClick(Sender: TObject);
begin
  inherited;
  
  If dbchkFlgContaTS.Checked
   Then dbchkFlgTempoManut.Enabled := True
   Else dbchkFlgTempoManut.Enabled := False;
  
end;

procedure TfrmCadHistFuncPartCS.qryDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  iProxSeq := 0;
end;

procedure TfrmCadHistFuncPartCS.sbtnInsDetClick(Sender: TObject);
begin
  qrydet.first;
  
  iProxSeq := qrydet.fieldbyname('PROXSEQHISTFUNC').AsInteger + 1; 

  HabilitaBotoes(False);
  
  inherited;

  
  QryDet.FieldByName('IDDOCUMENTO').Clear;
  QryDet.FieldByName('NUMDOCUMENTO').AsString := '';
  
end;

procedure TfrmCadHistFuncPartCS.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  
  QryDet.FieldByName('SEQHISTFUNC').AsInteger     := iProxSeq  ;

  qrydet.fieldbyname('PROXSEQHISTFUNC').AsInteger := iProxSeq  ; //Bruno Bastos - Pend. 18665 - 18/02/2005
end;

procedure TfrmCadHistFuncPartCS.LimpaTela;
begin
//  Limpa dados do Mestre
  edDocumento.Text    := '';
  edParticipante.Text := '';

  edMatricula.Text      := '';
  dtAdmissao.Text       := '';
  PnlTempoTotal.Caption := '';
  PnlTempoSC.Caption    := '';
  PnlTempoINSS.Caption  := '';
  qryDet.Close;
  
end;

procedure TfrmCadHistFuncPartCS.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  bEditaDet := False; 
end;

procedure TfrmCadHistFuncPartCS.bbtnVoltarDetClick(Sender: TObject);
begin
  HabilitaBotoes(True);
  inherited;
  bEditaDet := False; 
end;

procedure TfrmCadHistFuncPartCS.HabilitaBotoes(bHabilita : Boolean);
begin
  bbtnConfirmar.Enabled := bHabilita;
  bbtnCancelar.Enabled  := bHabilita;
  bbtnSair.Enabled      := bHabilita;
  bbtnAjuda.Enabled     := bHabilita;
  dbgrdDet.Enabled      := bHabilita;
end;

procedure TfrmCadHistFuncPartCS.sbtnAltDetClick(Sender: TObject);
begin
  HabilitaBotoes(False);
  inherited;
end;

procedure TfrmCadHistFuncPartCS.bbtnCancelarDetClick(Sender: TObject);
begin
  HabilitaBotoes(True);
  inherited;
end;


procedure TfrmCadHistFuncPartCS.dblkpcmbPatroExit(Sender: TObject);
begin
  inherited;
  If qryDet.State in [dsInsert, dsEdit]
   Then qryDet.FieldByName('EMPRESA').AsString:= dblkpcmbPatro.Text;
end;


end.
