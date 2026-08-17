unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  fcStatusBar;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    qrySelHotel: TwwQuery;
    qryParam: TwwQuery;
    mnuConfFlash: TMenuItem;
    mnuPOA: TMenuItem;
    mnuDepRev: TMenuItem;
    procedure mnuPOAClick(Sender: TObject);
    procedure mnuDepRevClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.DFM}

uses uMensErro, FSelHotel, FConfigPOA, FConfDeptRev, uIntegraBack;


procedure TfrmPrincipal.mnuPOAClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConfigPOA, TfrmConfigPOA, False);
end;

procedure TfrmPrincipal.mnuDepRevClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConfDeptRev, TfrmConfDeptRev, False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var Hotel: Longint;
begin
  inherited;
  if Sistema.FezLogin then
  begin
     Hotel := 0;
     qrySelHotel.Close;
     qrySelHotel.ParamByName('PESSOA').AsInteger := Sistema.idEmpresa;
     qrySelHotel.Open;
     //
     If qrySelHotel.IsEmpty Then
        // Obrigar a cadastrar
         Begin
             MsgDlg('Para usar o sistema de faturamento,cadastrar o hotel ','Aviso',mtWarning,[mbOk],0);
             //AbrirFormModal(FrmHotel,TFrmHotel);
         End
     Else
     If qrySelHotel.RecordCount = 1 Then
        // Setar a Variavel global iHotel
        Hotel := qrySelHotel.FieldByName('IDHOTEL').AsInteger
     Else
     If qrySelHotel.RecordCount >= 2 Then
       // Mostra os hoteis pretencentes a empresa
       repeat
         Hotel := SelecionaHotel;
       until Hotel >= 0;
     //
     qrySelHotel.Close;
     //
     qryParam.Close;
     qryParam.ParamByName('IDHOTEL').AsFloat := Hotel;
     qryParam.Open;
     Modulo.dDataSistema := qryParam.FieldByName('DATASISTEMA').AsDateTime;
     qryParam.Close;
     //
     Modulo.iHotel := Hotel;
     Modulo.IdUsuario := Sistema.IdUsuario;
     Modulo.NomeUsuario := Sistema.NomeUsuario;
     Modulo.IdEmpresa := Sistema.IdEmpresa;

     mnuPOA.Enabled := True;
     mnuDepRev.Enabled := True;
  end;
end;

initialization
   Sistema.NomeModulo :=  'Relatórios Avulsos';//'FlashRpt';    // Nome do Módulo
   Sistema.IdModulo := 143 ;              // IdModulo cadastrado no SAD
   Sistema.Versao := '3.00.04';
   Sistema.NomeAplicativo := 'Gerador - Flash Report';
   Modulo := TModulo.Create;
   IntegraBack := TIntegraBack.Create(True,True,True);
finalization
   Modulo.Free;
   IntegraBack.Free;
end.
