unit FMTExcluiEfetCxPeq;

{
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Mask, TREdit,
  DBClient, uCMClientDataSet,uCtrlCaixaPequeno, Wwquery;

type
  TfrmMTExcluiEfetCxPeq = class(TfrmSairAjuda)
    dsLanc: TwwDataSource;
    dsTot: TwwDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Grdlanc: TwwDBGrid;
    Panel4: TPanel;
    Panel3: TPanel;
    memHist: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edDataEfet: TDBEdit;
    BtnSel: TBitBtn;
    edNumBord: TRealEdit;
    dsCP: TwwDataSource;
    dsBord: TwwDataSource;
    edSaldo: TRealEdit;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    edForn: TEdit;
    cdsLanc: TCMClientDataSet;
    cdsTot: TCMClientDataSet;
    cdsCP: TCMClientDataSet;
    cdsBord: TCMClientDataSet;
    edValTot: TDBRealEdit;
    edCxPeq: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNumBordExit(Sender: TObject);
  private
    { Private declarations }
    CaixaPequeno : TCtrlCaixaPequeno;
    Procedure Sel;
    Procedure SelIni;
  public
    { Public declarations }
  end;

var
  frmMTExcluiEfetCxPeq : TfrmMTExcluiEfetCxPeq;
  iIdCaixaPeq     : LongInt;
implementation

{$R *.DFM}
Uses uSistema, uMensErro,dBaseDados;

Procedure TfrmMTExcluiEfetCxPeq.Sel;
Begin
  If edNumBord.Value > 0 Then
     Begin
        cdsBord.Data := CaixaPequeno.ListaCaixaData(Sistema.IdEmpresa,Sistema.IdUsuario,edNumBord.Value);
        If Not cdsBord.IsEmpty Then
           Begin
               iIdCaixaPeq  := cdsBord.FieldByName('IDCAIXAPEQUENO').AsInteger;
               cdsCP.Data   := CaixaPequeno.ListaCaixaPequeno(Sistema.IdEmpresa,Sistema.IdUsuario,iIdCaixaPeq,False);
               cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(iIdCaixaPeq,edNumBord.Value);
               TFloatField(cdsLanc.FieldByName('VLRLANC')).DisplayFormat := '#,##0.00';
               //
               cdsTot.Data := CaixaPequeno.ListaTotalLancCxPeq(iIdCaixaPeq,edNumBord.Value);
               edCxPeq.Text  := cdsCP.FieldByName('DESCCAIXAPEQ').asString;
               edForn.Text   := cdsCP.FieldByName('RAZAOSOCIAL').asString;
               edSaldo.Value := (cdsCP.FieldByName('VLRTOTCAIXAPEQ').asFloat - cdsTot.FieldByName('TOTAL').asFloat);
           End
        Else
           Begin
              iIdCaixaPeq := -1;
              MsgDlg('Nº de Borderô não existe ou pertence a um caixa pequeno que você não esta habilitado','Erro',mtError,[mbOk],0);
              edNumBord.SetFocus;
           End;
     End;
End;
procedure TfrmMTExcluiEfetCxPeq.FormCreate(Sender: TObject);
begin
  inherited;
  CaixaPequeno := TCtrlCaixaPequeno.Create;
  CaixaPequeno.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //
  SelIni;
end;

procedure TfrmMTExcluiEfetCxPeq.BtnSelClick(Sender: TObject);
begin
  inherited;
  if (edNumBord.Value <= 0 ) Then
    Begin
        MsgDlg('Selecione o Nº do borderô a ser Excluido','Erro',mtError,[mbOk],0);
        edNumBord.SetFocus;
    End
  Else
    Begin
       if MsgDlg('Confirma a Exclusão do Borderô '+trim(edNumBord.Text)+'?' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          Begin
             if not CaixaPequeno.ExcluiEfetCaixaPequeno(edNumBord.Value,Sistema.idUsuario,Sistema.idModulo,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro) then
                MsgDlg('Exclusão do borderô Não Efetuada. '+CaixaPequeno.MessageInfo,'Erro',mtError,[mbOk],0)
             else
                begin
                   MsgDlg(CaixaPequeno.MessageInfo,'Aviso',mtWarning,[mbOk],0);
                   SelIni;
                end;
          end
       else
          edNumBord.SetFocus;
    end;
end;

procedure TfrmMTExcluiEfetCxPeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CaixaPequeno.Free;
end;

procedure TfrmMTExcluiEfetCxPeq.edNumBordExit(Sender: TObject);
begin
  inherited;
  Sel;
end;

procedure TfrmMTExcluiEfetCxPeq.SelIni;
begin
   edForn.Clear;
   edNumBord.Value := 0;
   edCxPeq.Clear;
   //
   cdsBord.Data := CaixaPequeno.ListaCaixaData(-1,-1,-1);
   //
   cdsLanc.Data := CaixaPequeno.ListaLancCxPeq(-1,-1);
   TFloatField(cdsLanc.FieldByName('VLRLANC')).DisplayFormat := '#,##0.00';
   //
   cdsTot.Data := CaixaPequeno.ListaTotalLancCxPeq(-1,-1);
   edSaldo.Value := 0;
end;

end.
