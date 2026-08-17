unit FCadCenarioAplic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask, DBCtrls;

type
  TfrmCadCenarioAplic = class(TfrmCadastroCS)
    Label1: TLabel;
    dbedDescricao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCenarioAplic: TfrmCadCenarioAplic;

implementation

{$R *.DFM}

uses uMensErro,UDataBase;

procedure TfrmCadCenarioAplic.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDCenarioOrcamen').AsFloat:=-1;
  qry.Open;
  qry.First;
end;

procedure TfrmCadCenarioAplic.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in [dsInsert,dsEdit] then
      if dbedDescricao.Text='' then
         begin
            MsgDlg('Obrigatório Preencher a Descrição.','Erro',mtError,[mbOk],0);
            dbedDescricao.SetFocus;
         end
        else
         begin
            qry.FieldByName('IDCenarioOrcamen').AsFloat:=LeUltRegistro(nil,'CenarioOrcamen');
            inherited;
         end
   else
    inherited;
end;

procedure TfrmCadCenarioAplic.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       qry.Close;
       qry.ParamByName('IDCenarioOrcamen').AsFloat:=StrToInt(MontaSelect.ValoresChave[0]);
       qry.Open;
       qry.First;
    end;
end;

end.
