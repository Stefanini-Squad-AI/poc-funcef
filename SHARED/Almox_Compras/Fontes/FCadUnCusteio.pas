unit FCadUnCusteio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  StdCtrls, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, DBCtrls, Mask, MAHlpBtn, FCadastroGridCS, IvDictio, IvMulti,
  IvEMulti, CmEventosCadastro, ImgList;

type
  TFrmCadUnCusteio = class(TFrmCadastroGridCS)
    qryCODCUSTEIO: TFloatField;
    qryDESCCUSTEIO: TStringField;
    qryUCCONTABIL: TStringField;
    qryIDPESSOA: TFloatField;
    Label1: TLabel;
    dbedDesc: TDBEdit;
    chkContabil: TDBCheckBox;
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUnCusteio: TFrmCadUnCusteio;

implementation
{$R *.DFM}
Uses uMensErro, uSistema, uDataBase, DBaseDados ;

procedure TFrmCadUnCusteio.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    dbedDesc.SetFocus;
End;

procedure TFrmCadUnCusteio.CmeCadastroInsert(Sender: TObject);
Begin
    inherited;
    qry.FieldByName('CODCUSTEIO').asString := '';
    dbedDesc.SetFocus;
End;

Procedure TFrmCadUnCusteio.CmeCadastroConfirma(Sender: TObject);
Var
   sSql : String;
Begin
 If qry.state in [dsInsert,dsEdit] Then
   Begin
      StartTransacao;
      Try
          If qry.state = dsInsert Then
             qry.FieldByName('CODCUSTEIO').asInteger := LeUltRegistro(nil,'UNCUSTEI');
          qry.FieldByName('IDPESSOA').asInteger   := Sistema.IdEmpresa;
          qry.ApplyUpdates;
          qry.CommitUpdates;
          sSql := 'UPDATE ALMOX SET CONTABIL = '+QuotedStr(qry.FieldByName('UCCONTABIL').asString)
                 +' WHERE (CODCUSTEIO = '+qry.FieldByName('CODCUSTEIO').asString +')';
          If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
             Abort;
          CommitTransacao;
      Except
          RollBackTransacao;
          Raise;
      End;
   End;
 inherited;
End;
Procedure TFrmCadUnCusteio.CmeCadastroFind(Sender: TObject);
Begin
   inherited;
   if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
     Begin
        qry.locate('CODCUSTEIO',StrToInt(MontaSelect.ValoresChave[0]),[]);
     end;
End;

procedure TFrmCadUnCusteio.bbtnConfirmarClick(Sender: TObject);
begin
   if Trim(dbedDesc.Text) = ''  Then
     begin
        MsgDlg('Campo descrição está vazio preencha-o por favor','ERRO', mtError,[mbOk], 0);
        dbedDesc.SetFocus;
        Exit;
     end;
    inherited;
end;

procedure TFrmCadUnCusteio.FormCreate(Sender: TObject);
begin
  qry.Close;
  qry.Params[0].AsInteger := Sistema.IdEmpresa;
  qry.Open;
  inherited;
  MontaSelect.Filtro.Add('Idpessoa = '+ IntToStr(Sistema.IdEmpresa));
end;

end.



