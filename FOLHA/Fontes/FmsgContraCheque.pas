unit FmsgContraCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls, wwdblook;

type
  TFrmMsgContraCheque = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    qryRegra: TQuery;
    DsRegra: TDataSource;
    mmMensagem: TDBMemo;
    DBEDescricao: TDBEdit;
    DBLKREGRA: TwwDBLookupCombo;
    qryIDMSG: TFloatField;
    qryMSG: TStringField;
    qryIDREGRA: TFloatField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryDESCRICAO: TStringField;
    qryFLGATIVO: TFloatField;
    cboxsubmsg: TDBCheckBox;
    DBRTipoRegra: TDBRadioGroup;
    qryFLGTIPOREGRA: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMsgContraCheque: TFrmMsgContraCheque;

implementation
Uses Umenserro, UDatabase, FTelaAut, USistema, uAdmPrevFB, uFolhaBenef, dBaseDados;
{$R *.DFM}

procedure TFrmMsgContraCheque.CmeCadastroFind(Sender: TObject);
begin
  inherited;
     if MontaSelect.RetornouValor then
  begin
     if qryRegra.Active then
            qryRegra.Close;
     qryRegra.Open;

    qry.Close;
    qry.ParamByName('IDMSG').AsString:=MontaSelect.ValoresChave[0];
    qry.Open;
   
  end;  

end;

procedure TFrmMsgContraCheque.sbtnInserirClick(Sender: TObject);
begin
   if qryRegra.Active then
            qryRegra.Close;
     qryRegra.Open;

  IF qry.Active THEN
        qry.Close;
  qry.Open;      
  inherited;
 

end;

procedure TFrmMsgContraCheque.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDMSG').AsInteger:=LeUltRegistro(nil,'MSGCONTRACHEQUE');
   DBRTipoRegra.itemindex:=0;

end;

procedure TFrmMsgContraCheque.bbtnConfirmarClick(Sender: TObject);
begin
if Trim(dbeDescricao.Text) = '' then
  begin
    MsgDlg('Descrição não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

   

  inherited;
   DBRTipoRegra.itemindex:=0;
end;

end.
