unit FCadCalendPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls,
  IvDictio, IvMulti, IvEMulti, wwdbedit, Wwdbspin, Spin, ComCtrls,
  CmEventosCadastro, ImgList;

type
  TfrmCadCalendPrev = class(TfrmCadastroCS)
    qryIDCALENDARIO: TFloatField;
    qryNOME: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    qryConsCalendDatas: TwwQuery;
    qryDelCalendDatas: TwwQuery;
    qryConsCalendDatasIDCALENDARIO: TFloatField;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCalendPrev: TfrmCadCalendPrev;

implementation

uses UDataBase, USistema, UMensErro;

var
   liIndice : Longint;

{$R *.DFM}

procedure TfrmCadCalendPrev.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if ds.State = dsInsert
  then begin
         liIndice := LeUltRegistro(NIL, 'CALENDPREV');
         qry.FieldByName('IDCALENDARIO').AsInteger := liIndice;
       end;
end; 

procedure TfrmCadCalendPrev.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')
  then begin
         qry.Close;
         qry.ParamByName('pIdCalendario').Value := StrToInt(MontaSelect.ValoresChave[0]);
         qry.Open;
       end;
end; 

procedure TfrmCadCalendPrev.sbtnInserirClick(Sender: TObject);
begin

  if ds.State = dsInactive
  then qry.Open;
  inherited;
end; 

procedure TfrmCadCalendPrev.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('pIdCalendario').Value := 0;
  qry.Open;
end; 

procedure TfrmCadCalendPrev.FormCreate(Sender: TObject);
begin
  inherited;
  qryConsCalendDatas.Prepare;
  qryDelCalendDatas.Prepare;
end; 

procedure TfrmCadCalendPrev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryConsCalendDatas.Close;
  qryConsCalendDatas.UnPrepare;

  qryDelCalendDatas.Close;
  qryDelCalendDatas.UnPrepare;

end; 

procedure TfrmCadCalendPrev.sbtnApagarClick(Sender: TObject);
begin
  with qryConsCalendDatas do
  begin
    Close;
    ParamByName('pIdCalendario').Value := qry.FieldByName('IdCalendario').AsInteger;
    Open;
    if not IsEmpty
    then begin
           MsgDlg('Este calendário está associado a uma Fundação e/ou a um Plano de uma Patrocinadora. Verifique', TForm(Sender).Caption, mtInformation, [mbOk], 0);
           Close;
           sbtnApagar.Down := False;
           Exit;
         end
    else begin
           qryDelCalendDatas.Close;
           qryDelCalendDatas.ParamByName('pIdCalendario').Value := qry.FieldByName('IdCalendario').AsInteger;
           qryDelCalendDatas.ExecSQL;
           qryDelCalendDatas.Close;
         end;
    Close;
  end;
  inherited;
end; 

procedure TfrmCadCalendPrev.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
