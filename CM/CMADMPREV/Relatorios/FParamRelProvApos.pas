unit FParamRelProvApos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdblook, CMDBLookupCombo, StdCtrls, CheckLst, Mask,
  wwdbedit, Wwdbspin, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwdatsrc, Spin,
  wwdbdatetimepicker;

type
  TFrmParamRelProvApos = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    chklstBenef: TCheckListBox;
    GroupBox3: TGroupBox;
    dblookupPatrocinadora: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    dblkPlano: TwwDBLookupCombo;
    bbtnTodas: TBitBtn;
    bbtnInverte: TBitBtn;
    dsPatro: TwwDataSource;
    qryPatro: TwwQuery;
    dsPlano: TwwDataSource;
    qryPlano: TwwQuery;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    dbtDataRef: TwwDBDateTimePicker;
    qryAux: TwwQuery;
    qryAtivos: TwwQuery;
    Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery; Lista, Lista2: TStringList;
              Chave, Chave2, Descricao : String);
    procedure FormShow(Sender: TObject);
    procedure dblookupPatrocinadoraChange(Sender: TObject);
    procedure dblkPlanoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnTodasClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamRelProvApos: TFrmParamRelProvApos;
  Lstbenef           : TStringList;
  LstRegra           : TStringList;

implementation

uses UBeneficio, DRelatEspecificos, UMensErro, fAguarde;

{$R *.DFM}

procedure TFrmParamRelProvApos.CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
          Lista, Lista2: TStringList; Chave, Chave2, Descricao : String);
begin
  Lista.Clear;
  Lista2.Clear;
  ChkList.Items.Clear;
  While Not Query.Eof Do Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Lista2.Add(Query.FieldByName(Chave2).AsString);
    Query.Next;
  End;
end;

procedure TFrmParamRelProvApos.FormShow(Sender: TObject);
begin
  inherited;

 //cria Lista de benefícios e abre query
  Lstbenef     := TStringList.Create;
  LstRegra     := TStringList.Create;

  dtmRelatEspecificos.qryProvApos.Close;
  dtmRelatEspecificos.qryProvApos.Open;

  with qryPatro do //Selecionando automaticamente a Primeira Patrocinadora da Lista;
  begin
    Open;
    if RecordCount > 0 then
     dblookupPatrocinadora.Text := FieldByName('NOME').AsString;
  end;

  //Filtra Plano por Patrocinadora Indicada
  with  qryPlano do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
    if RecordCount > 0 then
     dblkPlano.Text := FieldByName('NOME').AsString;
  end;

  with  qryBenef do
  begin
    close;
    ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
    open;
  end;

  CriaLista(chklstBenef, qryBenef, LstBenef, LstRegra, 'IDBENEFICIO', 'IDREGRAELEGIBILI', 'NOME');

end;

procedure TFrmParamRelProvApos.dblookupPatrocinadoraChange(
  Sender: TObject);
begin
  inherited;
  with  qryPlano do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
    if RecordCount > 0 then
     dblkPlano.Text := FieldByName('NOME').AsString;
  end;

  with  qryBenef do
  begin
    close;
    ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
    open;
  end;

  CriaLista(chklstBenef, qryBenef, LstBenef, LstRegra, 'IDBENEFICIO', 'IDREGRAELEGIBILI', 'NOME');
end;

procedure TFrmParamRelProvApos.dblkPlanoChange(Sender: TObject);
begin
  inherited;
  with  qryBenef do
  begin
    close;
    ParamByName('IDPLANOPREV').AsInteger := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
    open;
  end;

  CriaLista(chklstBenef, qryBenef, LstBenef, LstRegra, 'IDBENEFICIO', 'IDREGRAELEGIBILI', 'NOME');
end;

procedure TFrmParamRelProvApos.bbtnConfirmarClick(Sender: TObject);
Var
 iCont,
 iIdRegra,
 iIdBeneficio      :  Integer;
 bCheck,
 bOk,
 bErro             :  Boolean;
 sSql,
 sNomeBenef,
 sMsgErro,
 sIdSitFunc,
 sIdSitPart,
 sIdSitPlanoPrev,
 sFlgInternoDepois :  String;
 dOpcao1,
 dOpcao2,
 dOpcao3           :  Double;
begin
  inherited;
  //  Início da validação dados informados na tela

  // Patrocinadora
  if Trim(dblookupPatrocinadora.Text) = ''
  then begin
    MsgDlg('Patrocinadora não escolhida.','Erro',mtError,[mbOk,mbHelp],0);
    dblookupPatrocinadora.SetFocus;
    Abort;
  end;

  // Plano
  if Trim(dblkPlano.Text) = ''
  then begin
    MsgDlg('Plano não escolhido.','Erro',mtError,[mbOk,mbHelp],0);
    dblkPlano.SetFocus;
    Abort;
  end;

  // Data de Referência
  if Trim(dbtDataRef.Text) = ''
  then begin
    MsgDlg('Data de Referência não escolhida.','Erro',mtError,[mbOk,mbHelp],0);
    dbtDataRef.SetFocus;
    Abort;
  end;

  // Benefício
  For iCont := 0 to chklstBenef.Items.Count -1
    Do If chklstBenef.Checked[iCont] Then bCheck := True;

  If Not bCheck
   Then Begin
     MsgDlg('Benefício não escolhido.','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
   End;

  //  Fim da validação dados informados na tela

 frmAguarde.Mostra('Montando dados para o relatório.');

  // Início da montagem da query de Ativos

  sSql := ' SELECT PE.IDPESSOA, PE.NOME, PP.IDPESSJUR, PT.NOME AS NOMEPATRO,'+
          '        PP.INSCRICAODATA, PP.DATACONTRIBINSS,'+
          '        PP.INSCRICAONUMERO, EL.MATRICULA,'+
          '        PP.SEQPROPOSTA, PP.IDPLANOPREV,'+
          '        PL.NOME AS NOMEPLANO,'+
          '        PP.IDSITPART, PP.IDSITPLANOPREV, EL.IDSITFUNC, ST.FLGINTERNO'+
          ' FROM PESSOA PE, PESSOA PT, PARTPREVPLAN PP, ELEGPATRO EL,'+
          '      PLANPREV PL, SITPART ST'+
          ' WHERE (PE.IDPESSOA      = EL.IDPESSOA)'+
          '   AND (EL.IDPESSOA      = PP.IDPESSOA)'+
          '   AND (EL.IDPESSJUR     = PP.IDPESSJUR)'+
          '   AND (PP.IDPESSJUR     = PT.IDPESSOA)'+
          '   AND (PP.IDPESSJUR     = '+qryPatro.FieldByName('IDPESSOA').AsString+')'+
          '   AND (PP.IDPLANOPREV   = '+qryPlano.FieldByName('IDPLANOPREV').AsString+')'+
          '   AND (PP.FLGDESATIVADO = 0)'+
          '   AND (PP.IDPLANOPREV   = PL.IDPLANOPREV)'+
          '   AND (PP.IDSITPART     = ST.IDSITPART)'+
          '   AND (ST.FLGINTERNO    = ''AT'')'+
          ' ORDER BY PE.NOME';

  qryAtivos.SQL.Clear;
  qryAtivos.SQL.Add(sSql);
  Try
   qryAtivos.Open;
  Except
   MsgDlg('Erro na query de ativos.','Erro',mtError,[mbOk,mbHelp],0);
   Exit;
  End;

  frmAguarde.pbAguarde.Min := 1;
  frmAguarde.pbAguarde.Max := qryAtivos.RecordCount;
  frmAguarde.pbAguarde.Visible := True;

  // Fim da montagem da query de Ativos

  // Início do loop de teste de regra para cada ativo

  qryAtivos.First;

  While Not qryAtivos.Eof do
   Begin
     For iCont := 0 to chklstBenef.Items.Count -1
      Do If chklstBenef.Checked[iCont]
          Then Begin

           frmAguarde.Mostra('Processando benefícios.');
           frmAguarde.pbAguarde.Position := qryAtivos.RecNo;

           Application.ProcessMessages;

           iIdBeneficio := StrToInt(Lstbenef.Strings[iCont]);
           iIdRegra     := StrToInt(LstRegra.Strings[iCont]);
           sNomeBenef   := chklstBenef.items[iCont];

           // Início da rotina de valor base
           sSql := ' SELECT VALORBASE1, VALORBASE2, VALORBASE3 FROM BENEFPLANOPART ' +
                   ' WHERE IDPESSJUR   = ' + qryAtivos.FieldByName('IDPESSJUR').AsString   +
                   '   AND IDPESSOA    = ' + qryAtivos.FieldByName('IDPESSOA').AsString    +
                   '   AND IDPLANOPREV = ' + qryAtivos.FieldByName('IDPLANOPREV').AsString +
                   '   AND SEQPROPOSTA = ' + qryAtivos.FieldByName('SEQPROPOSTA').AsString +
                   '   AND IDBENEFICIO = ' + IntToStr(iIdBeneficio);

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(sSql);
           Try
            qryAux.Open;
           Except
            MsgDlg('Erro na query de opções.','Erro',mtError,[mbOk,mbHelp],0);
            Exit;
           End;

           If qryAux.IsEmpty
            Then Begin
               dOpcao1 := 0;
               dOpcao2 := 0;
               dOpcao3 := 0;
            End
            Else Begin
               if qryAux.FieldByName('VALORBASE1').AsString <> ''
               then dOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
               else dOpcao1 := 0;

               if qryAux.FieldByName('VALORBASE2').AsString <> ''
               then dOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
               else dOpcao2 := 0;

               if qryAux.FieldByName('VALORBASE3').AsString <> ''
               then dOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
               else dOpcao3 := 0;
            End;
           // Fim da rotina de valor base

           // Início da rotina de situações
           sSql := ' SELECT EP.IDEVENTOGERADOR, EF.IDSITFUNC, EP.IDSITPART,'+
                   ' EL.IDSITPLANOPREV, ST.FLGINTERNO'+
                   ' FROM EVENTOXSITFUNC EF, EVENTOXSITPART EP, EVENTOXSITPLAPREV EL,'+
                   '      BENEFICIO BE, BENEFPLANPATRO BP, SITPART ST'+
                   ' WHERE EF.IDEVENTOGERADOR = EP.IDEVENTOGERADOR'+
                   '   AND EP.IDEVENTOGERADOR = EL.IDEVENTOGERADOR'+
                   '   AND BE.IDEVENTOGERADOR = EF.IDEVENTOGERADOR'+
                   '   AND BE.IDBENEFICIO     = BP.IDBENEFICIO'+
                   '   AND EP.IDSITPART       = ST.IDSITPART'+
                   '   AND BP.IDBENEFICIO     = '+IntToStr(iIdBeneficio)+
                   '   AND BP.IDPLANOPREV     = '+qryAtivos.FieldByName('IDPLANOPREV').AsString+
                   '   AND BP.IDPESSJUR       = '+qryAtivos.FieldByName('IDPESSJUR').AsString+
                   ' ORDER BY IDEVENTOGERADOR';

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(sSql);
           Try
            qryAux.Open;
           Except
            MsgDlg('Erro na query de situações.','Erro',mtError,[mbOk,mbHelp],0);
            Exit;
           End;
           sIdSitFunc        := qryAux.FieldByName('IDSITFUNC').AsString;
           sIdSitPart        := qryAux.FieldByName('IDSITPART').AsString;
           sIdSitPlanoPrev   := qryAux.FieldByName('IDSITPLANOPREV').AsString;
           sFlgInternoDepois := qryAux.FieldByName('FLGINTERNO').AsString;
           // Fim da rotina de situações

           // Início da rotina de Elegibilidade
           // Executa a regra para cada participante encontrado e,
           // caso a regra retorne true, alimenta a query que gerará
           // o relatório.
           bOk := ExecutaRegraElegibilidade(qryAux,
                                   iIdRegra,
                                   qryAtivos.FieldByName('IDPESSJUR').AsInteger,
                                   qryAtivos.FieldByName('IDPLANOPREV').AsInteger,
                                   qryAtivos.FieldByName('IDPESSOA').AsInteger,
                                   qryAtivos.FieldByName('SEQPROPOSTA').AsInteger,
                                   iIdBeneficio,
                                   dOpcao1, dOpcao2, dOpcao3,
                                   dbtDataRef.Text,
                                   dbtDataRef.Text,
                                   '',
                                   dbtDataRef.Text,
                                   qryAtivos.FieldByName('FLGINTERNO').AsString,
                                   sFlgInternoDepois,
                                   qryAtivos.FieldByName('IDSITPART').AsString,
                                   qryAtivos.FieldByName('IDSITPLANOPREV').AsString,
                                   qryAtivos.FieldByName('IDSITFUNC').AsString,
                                   sIdSitPart,
                                   sIdSitPlanoPrev,
                                   sIdSitFunc,
                                   1,
                                   0,
                                   bErro,
                                   sMsgErro );

           If bOk
            Then With dtmRelatEspecificos do
             Begin
               qryProvApos.Insert;

               qryProvApos.FieldByName('IDPESSOA').AsInteger        := qryAtivos.FieldByName('IDPESSOA').AsInteger;
               qryProvApos.FieldByName('NOME').AsString             := qryAtivos.FieldByName('NOME').AsString;
               qryProvApos.FieldByName('IDPESSJUR').AsInteger       := qryAtivos.FieldByName('IDPESSJUR').AsInteger;
               qryProvApos.FieldByName('NOMEPATRO').AsString        := qryAtivos.FieldByName('NOMEPATRO').AsString;
               qryProvApos.FieldByName('INSCRICAODATA').AsDateTime  := qryAtivos.FieldByName('INSCRICAODATA').AsDateTime;
               qryProvApos.FieldByName('INSCRICAONUMERO').AsInteger := qryAtivos.FieldByName('INSCRICAONUMERO').AsInteger;
               qryProvApos.FieldByName('MATRICULA').AsString        := qryAtivos.FieldByName('MATRICULA').AsString;
               qryProvApos.FieldByName('SEQPROPOSTA').AsInteger     := qryAtivos.FieldByName('SEQPROPOSTA').AsInteger;
               qryProvApos.FieldByName('IDPLANOPREV').AsInteger     := qryAtivos.FieldByName('IDPLANOPREV').AsInteger;
               qryProvApos.FieldByName('NOMEPLANO').AsString        := qryAtivos.FieldByName('NOMEPLANO').AsString;
               qryProvApos.FieldByName('NOMEBENEFICIO').AsString    := sNomeBenef;

               qryProvApos.Post;
             End;

     end;   // If chklstBenef.Checked[I]

   qryAtivos.Next;
   
  end;      // While Not qryAtivos.Eof
  frmAguarde.pbAguarde.Visible := False;
  frmAguarde.Apaga;
  dtmRelatEspecificos.ppLabel95.Caption := 'Relação de Prováveis Elegíveis a Benefício em '+dbtDataRef.Text;
  dtmRelatEspecificos.ppLabel111.Caption := 'Patrocinadora: '+dblookupPatrocinadora.Text;

end;

procedure TFrmParamRelProvApos.bbtnTodasClick(Sender: TObject);
var
 i: Integer;
begin
  inherited;
  If MsgDlg('O relatório será baseado em todos os benefícios.'+#13+#10+
            'O processo será demorado. Tem certeza que deseja continuar ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrNo
   Then Abort;

  for I := 0 to chklstBenef.Items.Count - 1 do
    chklstBenef.checked[I]:= True;
end;

procedure TFrmParamRelProvApos.bbtnInverteClick(Sender: TObject);
var
 i: Integer;
begin
  inherited;
  for I := 0 to chklstBenef.Items.Count - 1 do
    chklstBenef.Checked[I] := Not chklstBenef.Checked[I];
end;

end.
