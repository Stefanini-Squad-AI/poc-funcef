{*************************************************************}
{                                                             }
{ CM Soluções Informática                                     }
{ ** Todos os Direitos Reservados                             }
{ Analista Responsável: Davi Ramos                            }
{ Atualizado Em: Julho/2002                                   }
{                19/11/2003 - André Tavares - pendência 14962 }
{                                                             }
{*************************************************************}
Unit FCadPeriodoOrcMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, Wwdbspin, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, TREdit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlPeriodoOrcamen, uCMTypes, ComCtrls, Wwdotdot, Wwdbcomb, DBTables;

Type
  TfrmCadPeriodoOrcMT = class(TFrmCadastroMT)
    PageControl1: TPageControl;
    TbsInsPeriodo: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbrPeriodo: TDBRealEdit;
    dbrExercicio: TwwDBSpinEdit;
    dbedDataIni: TCMDateTimePicker;
    dbedDataFim: TCMDateTimePicker;
    dbeNomePeriodo: TwwDBEdit;
    TbsBlqPeriodo: TTabSheet;
    Label6: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    Chk1: TCheckBox;
    Chk3: TCheckBox;
    Chk2: TCheckBox;
    Chk4: TCheckBox;
    Chk6: TCheckBox;
    Chk5: TCheckBox;
    Chk7: TCheckBox;
    Chk8: TCheckBox;
    Chk9: TCheckBox;
    Chk10: TCheckBox;
    Chk11: TCheckBox;
    Chk12: TCheckBox;
    ChkTodos: TCheckBox;
    Query1: TQuery;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
    OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dbeNomePeriodoEnter(Sender: TObject);
    procedure dbedDataFimEnter(Sender: TObject);
    procedure ChkTodosClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    //function  ListaExercicios(idpessoa: integer) : OleVariant;

  Private
    { Private declarations }

    CtrlPeriodoOrcamen : TCtrlPeriodoOrcamen;

  Public
    { Public declarations }
  End;

Var
  frmCadPeriodoOrcMT: TfrmCadPeriodoOrcMT;

Implementation

Uses
  uSistema, uMensErro, dBaseDados, uFuncaoGeral, uDiasUteis;

{$R *.DFM}
//************************************************
Procedure TfrmCadPeriodoOrcMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Var
  Periodo : Integer;

Begin

  Accept := False;
  //Verifica o preenchimento dos campos
  If (dbrExercicio.Value = 0) Then Begin
    MsgDlg('Exercício não informado','Erro',mtError,[mbOk],0);
    exit;
  End;

  If (dbedDataIni.Text = '') Then Begin
    MsgDlg('Data Inicial não informada','Erro',mtError,[mbOk],0);
    dbedDataIni.SetFocus;
    exit;
  End;

  If (dbedDataFim.Text = '') Then Begin
    MsgDlg('Data Final não informada','Erro',mtError,[mbOk],0);
    dbedDataFim.SetFocus;
    exit;
  End;

  If (dbeNomePeriodo.Text = '') Then Begin
    MsgDlg('Descricao não informada','Erro',mtError,[mbOk],0);
    dbeNomePeriodo.SetFocus;
    exit;
  End;

  Try
    Periodo := StrToInt( dbrPeriodo.Text );

    If ( Periodo < 1 ) Then Begin

      MsgDlg( 'Período não informado', 'Erro', mtError, [mbOk], 0 );
      dbrPeriodo.SetFocus;
      Abort;
    End;
  Except

    Exit;
  End;

  Accept := True;
  Inherited;
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  MontaSelect.Filtro.Add( 'PERIODOORCAMEN.IDPESSOA = ' + IntToStr( Sistema.idempresa ) );

  CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;
  CtrlPeriodoOrcamen.Initialize( DtmBaseDados.dbBaseDados, True,
                                 Sistema.ConnectionType,   Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,  True, nil, nil, False );


  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CtrlPeriodoOrcamen.CdsPeriodoOrcamen := cds;
  //
  cds.Data := CtrlPeriodoOrcamen.Procurar(-1, -1, -1);
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
Begin
  Inherited;

  CtrlPeriodoOrcamen.Free;
End;
//************************************************
procedure TfrmCadPeriodoOrcMT.CmeCadastroInsert(Sender: TObject);
Var
  sDescPeriodo, sDataFim : string;
  iPeriodo,  iExercicio : Integer;
  wDia, wMes, wAno : word;
begin
  cds.Data     := CtrlPeriodoOrcamen.BuscaUltimoPeriodo(sistema.idEmpresa);
  decodeDate(cds.FieldbyName('DATAINIPERIODO').AsDateTime, wAno, wMes, wDia);
  iPeriodo     := cds.FieldByName('PERIODO').AsInteger;
  iExercicio   := cds.FieldByName('EXERCICIO').AsInteger;
  wdia         := 1;
  wAno         := iExercicio;
  if wMes = 12 then
  begin
    wMes       := 1;
    wAno       := iExercicio + 1;
  end
  else
    wMes := wMes + 1;
  sDataFim     := DiasUteis.UltimoDiaMes(FormatDateTime( 'dd/mm/yyyy', StrToDate(intToStr(wDia)+'/'+intToStr(wMes)+'/'+intToStr(wAno))));
  sDescPeriodo := FormatDateTime( 'mmmm', StrToDate( '01/'+intToStr(wMes)+'/'+intTostr(wAno)));

  inherited;

  cds.FieldByName('DATAFIMPERIODO').AsString := sDataFim;
  cds.FieldByName('NOMEPERIODO').AsString    := sDescPeriodo;
  cds.FieldByName('FLGBLOQUEADO').AsString   := 'N';
  cds.FieldByName('IDPESSOA').AsInteger      := sistema.idEmpresa;
  if iPeriodo < 12 then
  begin
    cds.FieldByName('EXERCICIO').AsInteger     := iExercicio;
    cds.FieldByName('PERIODO').AsInteger       := iPeriodo + 1;
    cds.FieldbyName('DATAINIPERIODO').AsString := intToStr(wdia)+'/'+intToStr(wmes)+'/'+intTostr(wAno);
  end
  else
  begin
    wmes := 1;
    wano := iExercicio + 1;
    cds.FieldByName('EXERCICIO').AsInteger     := iExercicio + 1;
    cds.FieldByName('PERIODO').AsInteger       := 1;
    cds.FieldbyName('DATAINIPERIODO').AsString := intToStr(wdia)+'/'+intToStr(wmes)+'/'+intTostr(wAno);
  end;

  dbrExercicio.Enabled := True;
  dbrPeriodo.Enabled   := True;
  //ERALDO SILVA SOL 108815 KINTANA 495652
  //COMENTADO PELO FATO DA ABA PERIODO ORCAMENTARIOS SÓ SER HABILITADA DURANTE A INSERÇÃO E ESTE CAMPO ESTAR CONTIDO NESTA.
  //dbrExercicio.SetFocus;
end;

//************************************************
procedure TfrmCadPeriodoOrcMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  dbrExercicio.Enabled := True;
  dbrPeriodo.Enabled   := True;
  //ERALDO SILVA SOL 108815 KINTANA 495652
  //COMENTADO PELO FATO DA ABA PERIODO ORCAMENTARIOS SÓ SER HABILITADA DURANTE A INSERÇÃO E ESTE CAMPO ESTAR CONTIDO NESTA.
  //dbedDataIni.SetFocus;
end;
//************************************************
procedure TfrmCadPeriodoOrcMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  If MontaSelect.RetornouValor Then Begin
     cds.Data := CtrlPeriodoOrcamen.Procurar( StrToInt( MontaSelect.ValoresChave[ 0 ] ),
                                              StrToInt( MontaSelect.ValoresChave[ 1 ] ),
                                              StrToInt( MontaSelect.ValoresChave[ 2 ] ) );
  end;
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);

Begin
  Inherited;

  Accept := CtrlPeriodoOrcamen.AplicaOperacaoPeriodoOrcamen;
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;

  Accept := CtrlPeriodoOrcamen.AplicaOperacaoPeriodoOrcamen;
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
Begin
  Inherited;

  Accept := CtrlPeriodoOrcamen.AplicaOperacaoPeriodoOrcamen;
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;

  If OrigemAbortConfirma <> OaBeforeConfirma Then Begin

    MsgDlg('Ocorreu o seguinte erro : '+ CtrlPeriodoOrcamen.MessageInfo, 'Aviso', mtError,[mbOK],0);
  End;
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.CmeCadastroAfterConfirma(Sender: TObject);
Begin
  Inherited;

  cds.Data := CtrlPeriodoOrcamen.Procurar( cds.FieldByName('IDPESSOA').AsInteger,
                                           cds.FieldByName('EXERCICIO').AsInteger,
                                           cds.FieldByName('PERIODO').AsInteger );
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.dbeNomePeriodoEnter(Sender: TObject);
Begin
  Inherited;

  //Preenche o nome do mês para o período
  If ( dbeNomePeriodo.Text = '' ) Then Begin

    cds.FieldByName('NOMEPERIODO').AsString := FormatDateTime( 'mmmm', StrToDate( dbedDataIni.Text ) );
  End;
End;
//************************************************
Procedure TfrmCadPeriodoOrcMT.dbedDataFimEnter(Sender: TObject);
Begin
  Inherited;

  //Preenche o último dia do mês para o período
  If ( dbedDataFim.Text =  '' ) Then Begin

    cds.FieldByName('DATAFIMPERIODO').AsString := DiasUteis.UltimoDiaMes( FormatDateTime( 'dd/mm/yyyy', StrToDate( dbedDataIni.Text ) ) );
  End;
End;
//************************************************



procedure TfrmCadPeriodoOrcMT.ChkTodosClick(Sender: TObject);
 //ERALDO SILVA SOL 108815 KINTANA 495652 INICIO
Var i: Integer;
begin
   inherited;
   Chk1.Checked := ChkTodos.Checked;
   Chk2.Checked := ChkTodos.Checked;
   Chk3.Checked := ChkTodos.Checked;
   Chk4.Checked := ChkTodos.Checked;
   Chk5.Checked := ChkTodos.Checked;
   Chk6.Checked := ChkTodos.Checked;
   Chk7.Checked := ChkTodos.Checked;
   Chk8.Checked := ChkTodos.Checked;
   Chk9.Checked := ChkTodos.Checked;
   Chk10.Checked := ChkTodos.Checked;
   Chk11.Checked := ChkTodos.Checked;
   Chk12.Checked := ChkTodos.Checked;
  //ERALDO SILVA SOL 108815 KINTANA 495652 FIM
end;

procedure TfrmCadPeriodoOrcMT.sbtnAlterarClick(Sender: TObject);
   //ERALDO SILVA SOL 108815 KINTANA 495652 INICIO
   // filtra a query
   var QryAux : TQuery;
   i : integer;
   nome : String;
   sSQL:string;
begin
  inherited;
  TbsInsPeriodo.Tabvisible := true;
  TbsBlqPeriodo.Tabvisible := true;
  try
     QryAux:= TQuery.Create(Self);
     QryAux.DatabaseName:='BASEDADOS';
     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Text := 'SELECT PERIODOORCAMEN.EXERCICIO, '+
                        'PERIODOORCAMEN.PERIODO,    '+
                        'PERIODOORCAMEN.NOMEPERIODO,    '+
                        'PERIODOORCAMEN.FLGBLOQUEADO    '+
                        'FROM PERIODOORCAMEN '+
                        'where PERIODOORCAMEN.EXERCICIO = ' + QuotedStr(wwDBSpinEdit1.Text) +
                        'order by PERIODOORCAMEN.EXERCICIO, PERIODOORCAMEN.PERIODO';
     QryAux.Open;

     i := 0;
     QryAux.first;
     while ( not QryAux.EOF ) do
     begin

         TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).visible := True;
         ChkTodos.Visible := true;
         wwDBSpinEdit1.Visible := true;
         Label6.Visible := true;

         if QryAux.FieldByName('FLGBLOQUEADO').AsString = 'S'
         then
            TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).checked := True;


         if QryAux.FieldByName('FLGBLOQUEADO').AsString = 'N'
         then
            TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).checked := False;

         TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).Caption := QryAux.FieldByName('NOMEPERIODO').AsString;
         inc(i);
               QryAux.next;
     end;
  finally;
   FreeAndNil(QryAux);
  end;
  //ERALDO SILVA SOL 108815 KINTANA 495652 FIM
end;

procedure TfrmCadPeriodoOrcMT.bbtnConfirmarClick(Sender: TObject);
   //ERALDO SILVA SOL 108815 KINTANA 495652 INICIO
  var
   i : integer;
   vlrchk: char;
   QryAux : TQuery;
   begin
   inherited;
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;
        try
          try
             QryAux:= TQuery.Create(Self);
             QryAux.DatabaseName:='BASEDADOS';
                for i := 0 to 11 do begin
                      vlrchk := 'N';
                   if TCheckBox( FindComponent( 'Chk' + IntToStr(i+1))).checked = true then
                       vlrchk := 'S';

                       QryAux.Close;
                       QryAux.SQL.Clear;
                       QryAux.SQL.Text := 'UPDATE ' +
                                          'PERIODOORCAMEN ' +
                                          'SET ' +
                                          'FLGBLOQUEADO = ' + QuotedStr(vlrchk) +
                                          ' WHERE ' +
                                          '(EXERCICIO = ' + QuotedStr(wwDBSpinEdit1.Text) + ')' +
                                          ' AND (PERIODO = ' + QuotedStr(InttoStr (i+1)) + ')' ;
                       QryAux.ExecSQL;
                   end;
             dtmBaseDados.dbBaseDados.Commit;
          except
          On E:EDBEngineError do
          begin
            MostrarErro(E);
            dtmBaseDados.dbBaseDados.Rollback;
          End;
          end;// except
        finally;
        FreeAndNil(QryAux);
   end;
   //ERALDO SILVA SOL 108815 KINTANA 495652 FIM
end;

procedure TfrmCadPeriodoOrcMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  //ERALDO SILVA SOL 108815 KINTANA 495652
  TbsInsPeriodo.Tabvisible := true;
  TbsBlqPeriodo.Tabvisible := false;
end;

procedure TfrmCadPeriodoOrcMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   //ERALDO SILVA SOL 108815 KINTANA 495652
  TbsInsPeriodo.Tabvisible := true;
  TbsBlqPeriodo.Tabvisible := true;
end;

procedure TfrmCadPeriodoOrcMT.sbtnProcurarClick(Sender: TObject);
//ERALDO SILVA SOL 108815 KINTANA 495652 INICIO
   // filtra a query
   var QryAux : TQuery;
   i : integer;
   nome : String;
   sSQL:string;
begin
  inherited;
  TbsInsPeriodo.Tabvisible := true;
  TbsBlqPeriodo.Tabvisible := true;
  try
     QryAux:= TQuery.Create(Self);
     QryAux.DatabaseName:='BASEDADOS';
     QryAux.Close;
     QryAux.SQL.Clear;
     QryAux.SQL.Text := 'SELECT PERIODOORCAMEN.EXERCICIO, '+
                        'PERIODOORCAMEN.PERIODO,    '+
                        'PERIODOORCAMEN.NOMEPERIODO,    '+
                        'PERIODOORCAMEN.FLGBLOQUEADO    '+
                        'FROM PERIODOORCAMEN '+
                        'where PERIODOORCAMEN.EXERCICIO = ' + QuotedStr(wwDBSpinEdit1.Text) +
                        'order by PERIODOORCAMEN.EXERCICIO, PERIODOORCAMEN.PERIODO';
     QryAux.Open;

     i := 0;
     QryAux.first;
     while ( not QryAux.EOF ) do
     begin

         TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).visible := True;
         ChkTodos.Visible := true;
         wwDBSpinEdit1.Visible := true;
         Label6.Visible := true;

         if QryAux.FieldByName('FLGBLOQUEADO').AsString = 'S'
         then
            TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).checked := True;


         if QryAux.FieldByName('FLGBLOQUEADO').AsString = 'N'
         then
            TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).checked := False;

         TCheckBox( FindComponent( 'Chk' + IntToStr(i+1) ) ).Caption := QryAux.FieldByName('NOMEPERIODO').AsString;
         inc(i);
               QryAux.next;
     end;
  finally;
   FreeAndNil(QryAux);
  end;
  //ERALDO SILVA SOL 108815 KINTANA 495652 FIM
end;

end.











