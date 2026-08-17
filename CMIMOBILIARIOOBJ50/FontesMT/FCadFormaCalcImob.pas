{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadFormaCalcImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTImob, uCmSqlParams, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBCtrls, Mask, DBTables, Wwquery,
  Provider, uCtrlFormaCalcImob, uCtrlPadroes, uMensErro, uSistema;

type
  TfrmCadastroFormaCalcImob = class(TfrmCadastroGridMTImob)
    DataSetProvider1: TDataSetProvider;
    wwQuery1: TwwQuery;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbmDescricao: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    CtrlFormaCalcImob : TCtrlFormaCalcImob;
  public
    { Public declarations }

  protected
    procedure FazerRefresh; override;
  end;

var
  frmCadastroFormaCalcImob: TfrmCadastroFormaCalcImob;

implementation

{$R *.DFM}



procedure TfrmCadastroFormaCalcImob.FazerRefresh;
begin
   inherited;
   Cds.Data := CtrlFormaCalcImob.LookupFormaCalcImob(Sistema.IdModulo);
   Repaint;
end;



procedure TfrmCadastroFormaCalcImob.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlFormaCalcImob := TCtrlFormaCalcImob.Create;
   CtrlFormaCalcImob.InitializeAs(Padroes);

   CtrlFormaCalcImob.CdsFormaCalcImob := Cds;
   FazerRefresh;
end;



procedure TfrmCadastroFormaCalcImob.CmeCadastroApplyInsert(sender: TObject;var Accept: Boolean);
begin
   inherited;
   Cds.FieldByName('IDMODULO').AsInteger := Sistema.IdModulo;
   Accept := CtrlFormaCalcImob.GravaFormaCalcImob;
end;



procedure TfrmCadastroFormaCalcImob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( CtrlFormaCalcImob );
   inherited;
end;



procedure TfrmCadastroFormaCalcImob.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if Cds.FieldByName('NOME').AsString = '' then
   begin
      MsgDlg('Informe o nome da Forma de Cálculo!','Aviso',mtWarning,[mbOk],0);
      Accept := False;
   end;
end;



procedure TfrmCadastroFormaCalcImob.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlFormaCalcImob.GravaFormaCalcImob;
   FazerRefresh;
end;



procedure TfrmCadastroFormaCalcImob.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlFormaCalcImob.GravaFormaCalcImob;
   FazerRefresh;
end;



end.
