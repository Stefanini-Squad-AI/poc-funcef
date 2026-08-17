unit FAdicionaForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CMProcuraSubTipo, Grids, Wwdbigrd, Wwdbgrid,
  fcLabel, uCMTypes;

type
  TfrmAdicionaForn = class(TfrmOkCancelar)
    cmpfNovoForn: TCMProcuraForCli;
    btnTodas: TSpeedButton;
    btnInverter: TSpeedButton;
    Panel7: TPanel;
    Panel4: TPanel;
    grdItem: TwwDBGrid;
    Panel5: TPanel;
    procedure cmpfNovoFornExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnTodasClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdicionaForn: TfrmAdicionaForn;

implementation

{$R *.DFM}
Uses uMensErro, FMontaProcesso, FCadAlmox;

procedure TfrmAdicionaForn.cmpfNovoFornExit(Sender: TObject);
begin
  inherited;
  If ActiveControl.Tag <> 99 then
     Begin
        if cmpfNovoForn.Valida <> VcOK Then
           cmpfNovoForn.SetFocus;
        If FrmMontaProcesso.qryForneCot.Locate('IDFORCLI',cmpfNovoForn.ForCliReg.Id,[]) Then
           Begin
              MsgDlg('Este fornecedor já está nesta cotação. Adição proibida','Erro',mtError,[mbOK],0);
              cmpFNovoForn.SetFocus;
           End;
     End;
end;

procedure TfrmAdicionaForn.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //Testar se existe restrição para este fornecedor para os artigos
  With FrmMontaProcesso Do
     Begin
        qryItemNovoForn.First;
        While Not qryItemNovoForn.EOF Do
           Begin
              If qryItemNovoFornATRIBUIDO.AsString = 'S' Then
                 Begin
                    qryCotacao.Insert;
                    qryCotacaoIDPROCXART.AsFloat   := qryItemNovoFornIDPROCXART.AsFloat;
                    qryCotacaoIDFORCLI.AsInteger   := cmpfNovoForn.ForCliReg.Id;
                    qryCotacaoCODARTIGO.AsString   := qryItemNovoFornCODARTIGO.AsString;
                    qryCotacaoDESCRICAO.AsString   := qryItemNovoFornDESCRICAO.AsString;
                    qryCotacaoRAZAOSOCIAL.AsString := cmpfNovoForn.Text;
                    qryCotacaoSTATUS.AsString      := 'S';
                    qryCotacao.Post;
                 End;
              qryItemNovoForn.Next;
           End;
        MontaArvore;
     End;
end;

procedure TfrmAdicionaForn.FormActivate(Sender: TObject);
begin
  inherited;
  cmpfNovoForn.SetFocus;
end;

procedure TfrmAdicionaForn.btnTodasClick(Sender: TObject);
begin
  inherited;
  With FrmMontaProcesso Do
     Begin
        qryItemNovoForn.First;
        While Not qryItemNovoForn.EOF Do
           Begin
                 qryItemNovoForn.Edit;
                 qryItemNovoFornATRIBUIDO.AsString := 'S';
                 qryItemNovoForn.Post;
                 qryItemNovoForn.Next;
           End;
     End;
end;

procedure TfrmAdicionaForn.btnInverterClick(Sender: TObject);
begin
  inherited;
  With FrmMontaProcesso Do
     Begin
        qryItemNovoForn.First;
        While Not qryItemNovoForn.EOF Do
           Begin
                 qryItemNovoForn.Edit;
                 If qryItemNovoFornATRIBUIDO.AsString = 'S' Then
                    qryItemNovoFornATRIBUIDO.AsString := 'N'
                 Else
                    qryItemNovoFornATRIBUIDO.AsString := 'S';
                 qryItemNovoForn.Post;
                 qryItemNovoForn.Next;
           End;
     End;
end;

end.
