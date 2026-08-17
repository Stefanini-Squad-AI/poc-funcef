unit FpRelValorIndic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97, StdCtrls, Buttons, ComCtrls, ExtCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, checklst, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  FOkCancelar, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmPRelValorIndic = class(TFrmOkCancelar)
    QryIndicadores: TwwQuery;
    QryIndicadoresIDPARAMEMISSOR: TFloatField;
    QryIndicadoresDESCPARAMEMISSOR: TStringField;
    QryIndicadoresIDREGRA: TFloatField;
    QryEmissores: TwwQuery;
    QryEmissoresIDEMISSOR: TFloatField;
    QryEmissoresSIGLAEMISSOR: TStringField;
    DtsEmissores: TwwDataSource;
    DtsIndicadores: TwwDataSource;
    Bevel1: TBevel;
    Label5: TLabel;
    lblDataIni: TLabel;
    lblFim: TLabel;
    Label1: TLabel;
    CkLstIndicadores: TCheckListBox;
    DateEdit1: TCMDateTimePicker;
    DateEdit2: TCMDateTimePicker;
    BtMarcar: TBitBtn;
    btnMarcarEm: TBitBtn;
    CkLstEmissores: TCheckListBox;
    RdgParam: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtMarcarClick(Sender: TObject);
    Procedure MontaQueryRelat;
    procedure btnMarcarEmClick(Sender: TObject);
    procedure RdgParamClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPRelValorIndic: TFrmPRelValorIndic;

implementation

Uses UBibliotecaInvest, UMensErro, FDmRelatorios;

Var
  Lista, ListaSelecionados,
  ListaEmissores, ListaSelEmissores     : TStringList;

{$R *.DFM}

//---------------------------------------------------------
// Mostra Formulario
procedure TFrmPRelValorIndic.FormShow(Sender: TObject);
begin
  inherited;
// Cria Listas
  Lista             := TStringList.Create;
  ListaSelecionados := TStringList.Create;
  ListaEmissores    := TStringList.Create;
  ListaSelEmissores := TStringList.Create;


// INDICADORES
//--------------------------------------------------------------------------//
// Abre Tabelas
  QryIndicadores.Open;
// Preenche o ListBox dos Indicadores
  While Not QryIndicadores.EOF Do Begin
    CkLstIndicadores.Items.Add(QryIndicadores.FieldByName('DESCPARAMEMISSOR').AsString);
    Lista.Add(QryIndicadores.FieldByName('IDPARAMEMISSOR').AsString);
// Proximo Registro
    QryIndicadores.Next;
  End;

// EMISSORES
//--------------------------------------------------------------------------//

// Abre Tabelas
  QryEmissores.Open;
// Preenche o ListBox dos Emissores
  While Not QryEmissores.EOF Do Begin
    CkLstEmissores.Items.Add(QryEmissores.FieldByName('SIGLAEMISSOR').AsString);
    ListaEmissores.Add(QryEmissores.FieldByName('IDEMISSOR').AsString);
// Proximo Registro
    QryEmissores.Next;
  End;
end;

procedure TFrmPRelValorIndic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Fecha Tabelas
  QryIndicadores.Close;
  QryEmissores.Close;
// Libera Objetos
  Lista.Free;
  ListaSelecionados.Free;
  ListaEmissores.Free;
  ListaSelEmissores.Free;
end;

//----------------------------------------------------------
// Marcar Todos os Indicadores
procedure TFrmPRelValorIndic.BtMarcarClick(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
// Marca Todos os Indicadores
  If BtMarcar.Caption = 'Marcar Todos' Then Begin
    For I := 0 To (CkLstIndicadores.Items.Count-1) Do Begin
      CkLstIndicadores.Checked[I] := True;
    End;
    BtMarcar.Caption := 'Desmarcar Todos'
  End Else Begin
    For I := 0 To (CkLstIndicadores.Items.Count-1) Do Begin
      CkLstIndicadores.Checked[I] := False;
    End;
    BtMarcar.Caption:='Marcar Todos'
  End;
end;


procedure TFrmPRelValorIndic.btnMarcarEmClick(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
// Marca Todos os Emissores
  If btnMarcarEm.Caption = 'Marcar Todos' Then Begin
    For I := 0 To (CkLstEmissores.Items.Count-1) Do Begin
      CkLstEmissores.Checked[I] := True;
    End;
    btnMarcarEm.Caption:='Desmarcar Todos'
  End Else Begin
    For I := 0 To (CkLstEmissores.Items.Count-1) Do Begin
      CkLstEmissores.Checked[I] := False;
    End;
    btnMarcarEm.Caption := 'Marcar Todos'
  End;
end;

//-----------------------------------------------
// Monta o SQL da Query
Procedure TFrmPRelValorIndic.MontaQueryRelat;
Var
  wLinha : String;
Begin

 if RdgParam.ItemIndex = 0 then
 begin

     // Monta o SQL da Query
       DmRelatorios.QryValIndic.SQL.Clear;
       DmRelatorios.QryValIndic.SQL.Add('SELECT  E.SIGLAEMISSOR,VPE.DATAREFPREMISSOR,  PE.DESCPARAMEMISSOR, '+
         '        VPE.VLRPARAMEMISSOR, VPE.IDPARAMEMISSOR, '+
         '        VPE.IDEMISSOR,VPE.IDREGRAUSOEMISSOR '+
         ' FROM   VALPARAMXEMISSOR VPE, EMISSOR E, PARAMEMISSOR PE '+
         ' WHERE 	(DATAREFPREMISSOR >= TO_DATE('''+DateEdit1.Text+''',''DD/MM/YYYY'')) 	AND '+
         '       	(DATAREFPREMISSOR <= TO_DATE('''+DateEdit2.Text+''',''DD/MM/YYYY'')) 	AND '+
         '	        (VPE.IDPARAMEMISSOR IN ('+ListaSelecionados.Text+')) 	AND'+
         '	        (VPE.IDEMISSOR IN ('+ListaSelEmissores.Text+')) AND	'+
         '	        (VPE.IDEMISSOR      =  E.IDEMISSOR) AND	'+
         '	        (PE.IDPARAMEMISSOR  =  VPE.IDPARAMEMISSOR)'+
         ' ORDER BY E.SIGLAEMISSOR, PE.DESCPARAMEMISSOR, VPE.DATAREFPREMISSOR');
 end
 else
 begin
     // Monta o SQL da Query
       DmRelatorios.QryValIndic.SQL.Clear;
       DmRelatorios.QryValIndic.SQL.Add(
         '        SELECT	E.SIGLAEMISSOR,VPE.DATAREFPREMISSOR,  PE.DESCPARAMEMISSOR, '+
         '        VPE.VLRPARAMEMISSOR, VPE.IDPARAMEMISSOR,'+
         '        VPE.IDEMISSOR,VPE.IDREGRAUSOEMISSOR '+
         ' FROM 	VALPARAMXEMISSOR VPE, EMISSOR E, PARAMEMISSOR PE,'+
         '        (SELECT VP.IDEMISSOR, VP.IDPARAMEMISSOR,'+
         '                MAX(VP.DATAREFPREMISSOR) AS DATAREFPREMISSOR'+
         '         FROM   VALPARAMXEMISSOR VP'+
         '         GROUP BY VP.IDEMISSOR, VP.IDPARAMEMISSOR) VP2'+
         ' WHERE' +
         '	        (VPE.IDPARAMEMISSOR IN ('+ListaSelecionados.Text+')) 	AND'+
         '	        (VPE.IDEMISSOR IN ('+ListaSelEmissores.Text+')) AND	'+
         '	        (VPE.IDEMISSOR      =  E.IDEMISSOR) AND	          '+
         '	        (PE.IDPARAMEMISSOR  =  VPE.IDPARAMEMISSOR) AND    '+
         '	        (VPE.IDEMISSOR        = VP2.IDEMISSOR)       AND  ' +
         '	        (VPE.IDPARAMEMISSOR   = VP2.IDPARAMEMISSOR)  AND  ' +
         '	        (VPE.DATAREFPREMISSOR = VP2.DATAREFPREMISSOR)     '+

         ' ORDER	 BY E.SIGLAEMISSOR, PE.DESCPARAMEMISSOR, VPE.DATAREFPREMISSOR');
 end;
End;

procedure TFrmPRelValorIndic.RdgParamClick(Sender: TObject);
begin
  inherited;
  if RdgParam.ItemIndex = 0 then
  begin
     lblDataIni.Visible := true;
     lblFim.Visible     := true;
     DateEdit1.Visible  := true;
     DateEdit2.Visible  := true;
  end
  else
  begin
     lblDataIni.Visible := false;
     lblFim.Visible     := false;
     DateEdit1.Visible  := false;
     DateEdit2.Visible  := false;
  end;
end;

procedure TFrmPRelValorIndic.bbtnConfirmarClick(Sender: TObject);
Var
  I, J :Integer;
begin
  inherited;
// Limpa Linha dos Selecionados
  ListaSelecionados.Clear;
  ListaSelEmissores.Clear;

 if (RdgParam.ItemIndex = 0) and ((DateEdit1.Text = '') or (DateEdit2.Text = ''))then
 begin
    MsgDlg('Datas não foram escolhidas ','Mensagem do Sistema ', mtWarning,[MbOk],0);
    Exit;
 end;

// Monta Lista dos Indicadores Selecionados
  For I := 0 To (CkLstIndicadores.Items.Count-1) Do Begin
// Caso Checado inclui na lista
    If CkLstIndicadores.Checked[I] Then Begin
      ListaSelecionados.Add(Lista.Strings[I]+',');
    End;
  End;
// Acerta Final da Linha dos Selecionados
  If (ListaSelecionados.Count) > 0 Then Begin
    ListaSelecionados.Strings[ListaSelecionados.Count-1] :=
      Copy(ListaSelecionados.Strings[ListaSelecionados.Count-1],
           0,Length(ListaSelecionados.Strings[ListaSelecionados.Count-1])-1);
  End Else Begin
// Testa se Indicadores foi escolhido
    MsgDlg('Indicadores não foram escolhidos ','Mensagem do Sistema ',
           mtWarning,[MbOk],0);
    Exit;
  End;


//---------------------------------------------------------------------------//
// Monta Lista dos Emissores Selecionados
  For J := 0 To (CkLstEmissores.Items.Count-1) Do Begin
// Caso Checado inclui na lista
    If CkLstEmissores.Checked[J] Then Begin
      ListaSelEmissores.Add(ListaEmissores.Strings[J]+',');
    End;
  End;
// Acerta Final da Linha dos Selecionados
  If (ListaSelEmissores.Count) > 0 Then Begin
    ListaSelEmissores.Strings[ListaSelEmissores.Count-1] :=
      Copy(ListaSelEmissores.Strings[ListaSelEmissores.Count-1],
           0,Length(ListaSelEmissores.Strings[ListaSelEmissores.Count-1])-1);
  End Else Begin
// Testa se Emissor foi escolhido
    MsgDlg('Emissores não foram escolhidos ','Mensagem do Sistema ',
           mtWarning,[MbOk],0);
    Exit;
  End;

// Monta a Query do Relatorio
  MontaQueryRelat;

// Preenche os Parametros
  if RdgParam.ItemIndex = 0 then
     DmRelatorios.LblPeriodo.Text      := DateEdit1.Text+' a '+DateEdit2.Text
  else
     DmRelatorios.LblPeriodo.Text      := 'Último Dado';
end;

end.




