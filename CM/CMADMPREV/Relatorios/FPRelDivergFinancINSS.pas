unit FPRelDivergFinancINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables, Wwquery;

type
  TfrmDivergFinanINSS = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    lblAnoMes: TLabel;
    lblMes: TLabel;
    seAno: TSpinEdit;
    cboxMes: TComboBox;
    qryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }


   MesAno  : String;
   wTabVazio : Boolean;

   Function Retorna(AnoMes: String) : Boolean;

  public
    { Public declarations }
  end;

var
  frmDivergFinanINSS: TfrmDivergFinanINSS;

implementation

uses  DrelatAdmPrev, uDataBAse, UMensErro, UAdmPrev, DBaseDados;

{$R *.DFM}


Function TfrmDivergFinanINSS.Retorna(AnoMes: String) : Boolean;
Var
  wTabVazio : Boolean;
begin
  With  qryAux Do Begin
        Sql.Clear;
        Sql.Add( 'SELECT MESREFERENCIA FROM DETCONCINSS '+
                 'WHERE MESREFERENCIA = '+AnoMes) ;
        Open;
// Se a query estiver vazia retorna TRUE.
        result := IsEmpty;
        end;
end;


procedure TfrmDivergFinanINSS.bbtnConfirmarClick(Sender: TObject);
Var
  Mes, MesAno,AnoMes : String;
  wTabVazio : Boolean;
begin

  // Critica Dados 
  If cboxMes.Text = ''  Then Begin
    ShowMessage('Falta Preencher Campo ...');
    cboxMes.SetFocus;
    ModalResult := mrNone;
  End;


// Transforma data em AnoMes
  if (cboxMes.ItemIndex + 1) < 9 then
    Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  else
    Mes := IntToStr((cboxMes.ItemIndex + 1));

    MesAno :=  IntToStr(seAno.Value) + '/' + Mes ;

  If   cboxMes.Text <> '' Then
     wTabVazio := Retorna(QuotedStr(MesAno));


// Testa se arquivo texto já foi importado
  If  (wTabVazio = True) Then Begin
    MsgDlg('Não existem Dados para o mês desejado . ','Erro ',mtError,[mbOk],0);
    ModalResult := mrNone;
   End;

//  Passagem de Parâmetro

   with dtmRelatAdmPrev.qryDivergFinanINSS do
    begin  
     Close;
     ParamByName('PMES').AsString := MesAno;
     Open;
    end;

 inherited;
end;

end.
