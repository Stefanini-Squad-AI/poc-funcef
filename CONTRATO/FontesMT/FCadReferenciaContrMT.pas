unit FCadReferenciaContrMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, Mask, DBCtrls, uCtrlReferenciaContr;

type
  TfrmCadReferenciaContrMT = class(TFrmCadastroMT)
    spTeste: TCMSqlParams;
    Label2: TLabel;
    dbeNomeReferencia: TDBEdit;
    gbCalcAtrasados: TGroupBox;
    dbcbSabados: TDBCheckBox;
    dbcbDomingos: TDBCheckBox;
    dbcbFeriados: TDBCheckBox;
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlReferenciaContr: TCtrlReferenciaContr;
  public
    { Public declarations }
  end;

var
  frmCadReferenciaContrMT: TfrmCadReferenciaContrMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadReferenciaContrMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlReferenciaContr
   CtrlReferenciaContr:=TCtrlReferenciaContr.Create;
   CtrlReferenciaContr.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega Cds   
   Cds.Data:=CtrlReferenciaContr.ListReferenciaContr(-1); //vazio

   //Associa Cds
   CtrlReferenciaContr.CdsReferenciaContr:=Cds;
end;

procedure TfrmCadReferenciaContrMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlReferenciaContr.Free;
   inherited;
end;

procedure TfrmCadReferenciaContrMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       Cds.Close;
       Cds.Data:=CtrlReferenciaContr.ListReferenciaContr(StrToFloat(MontaSelect.ValoresChave[0]));
    end;
end;

procedure TfrmCadReferenciaContrMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   Cds.FieldByName('FLGSABADOS').AsString:='N';
   Cds.FieldByName('FLGDOMINGOS').AsString:='N';
   Cds.FieldByName('FLGFERIADOS').AsString:='N';
end;

procedure TfrmCadReferenciaContrMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept:=True;
   if (Trim(dbeNomeReferencia.Text)='') then
    begin
       MsgDlg('O Nome da Referência não pode ser deixado em Branco.','Erro',mtError,[mbOK],0);
       Accept:=False;
    end;
end;

procedure TfrmCadReferenciaContrMT.CmeCadastroConfirma(Sender: TObject);
begin
   if CtrlReferenciaContr.AplicaReferenciaContr then
      inherited
   else
      MsgDlg(CtrlReferenciaContr.MessageInfo,'Erro',mtError,[mbOK],0);
end;

end.
