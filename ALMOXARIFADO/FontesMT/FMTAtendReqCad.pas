{-------------------------------------------------------------------------------
 Data       : 25.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22578
 Descrição  : Alteração do Label Departamento p/ Centro de Custo
----------------------------------------------------------------------------------}

unit FMTAtendReqCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, TEdNum, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, uCtrlReqMat,uCtrlAlmox,
  uCtrlCentroCusto, Db, DBClient, uCMClientDataSet, Mask, wwdbedit,
  Wwdatsrc, TREdit, uCtrlArtigo, uCtrlMovEstoque, uCtrlUnMedida,
  CmParamReport, ImgList, Menus, uCtrlParamIntegra, uCtrlParamGlobal;

type
  TFrmMTAtendReqCad = class(TfrmSairAjuda)
    pnlSelect: TPanel;
    Label1: TLabel;
    EdNumReq: TEditNum;
    Label4: TLabel;
    dblcCCust: TwwDBLookupCombo;
    Label2: TLabel;
    edDataReq: TCMDateTimePicker;
    Label3: TLabel;
    EdDataNec: TCMDateTimePicker;
    BtLimpa: TBitBtn;
    btnSelecionar: TBitBtn;
    Panel2: TPanel;
    Bevel1: TBevel;
    GrdReq: TwwDBGrid;
    Bevel2: TBevel;
    BtnEstornar: TBitBtn;
    BtAtender: TBitBtn;
    cdsItem: TCMClientDataSet;
    cdsCentCusto: TCMClientDataSet;
    pnlDet: TPanel;
    dsItem: TwwDataSource;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edCadArt: TwwDBEdit;
    EdDescArt: TwwDBEdit;
    EdReqArt: TwwDBEdit;
    edLocalizacao: TEdit;
    lblDpto: TLabel;
    edDepto: TEdit;
    lblNome: TLabel;
    edNome: TEdit;
    Label11: TLabel;
    EdQtdeSolic: TDBRealEdit;
    Label5: TLabel;
    reSaldo: TRealEdit;
    Label10: TLabel;
    EdSalComp: TRealEdit;
    Label12: TLabel;
    EdQtdeAtend: TRealEdit;
    edDataAtend: TCMDateTimePicker;
    Label13: TLabel;
    dsSubGrid: TwwDataSource;
    grdReqOut: TwwDBGrid;
    Label14: TLabel;
    BtOk: TBitBtn;
    btCancela: TBitBtn;
    cdsSubGrid: TCMClientDataSet;
    cdsParamGlobal: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure BtLimpaClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure BtAtenderClick(Sender: TObject);
    procedure BtnEstornarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataAtendExit(Sender: TObject);
    procedure EdQtdeAtendExit(Sender: TObject);
  private
    { Private declarations }
    CtrlParamGlobal : TCtrlParamGlobal;
    ReqMat      : TCtrlReqMat;
    Almox       : TCtrlAlmox;
    Artigo      : TCtrlArtigo;
    CentroCusto : TCtrlCentroCusto;
    MovEstoque  : TCtrlMovEstoque;
    UnMedida    : TCtrlUnMedida;
    //
    Procedure Sel; 
    Procedure Atender;
  public
    { Public declarations }
  end;

var
  FrmMTAtendReqCad: TFrmMTAtendReqCad;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uModulo, DBaseDados;

procedure TFrmMTAtendReqCad.FormCreate(Sender: TObject);
begin
  inherited;
  ReqMat := TCtrlReqMat.Create;
  ReqMat.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ReqMat.cdsItem := cdsItem;

  UnMedida := TCtrlUnMedida.Create;
  UnMedida.InitializeAs(ReqMat);
  
  Almox := TCtrlAlmox.Create;
  Almox.InitializeAs(ReqMat);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(ReqMat);

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs(ReqMat);

  MovEstoque := TCtrlMovEstoque.Create;
  MovEstoque.InitializeAs(ReqMat);

  // Marchetti - Pendencia 27699
  CtrlParamGlobal   := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs(ReqMat);
  cdsParamGlobal.Data := CtrlParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);

//  cdsCentCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');
  cdsCentCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A',cdsParamGlobal.FieldByName('IDPLANCENTCUST').AsInteger);
  // Fim Marchetti - Pendencia 27699

  cdsItem.Data := ReqMat.ListItemAntendimento(-1,-1);

  GrdReq.BringToFront;
end;

procedure TFrmMTAtendReqCad.Atender;
Var
  rSaldo : Double;
begin
 rSaldo := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                cdsItem.FieldByName('CODARTIGO').AsString,
                                Modulo.icodAlmoxa,
                                Date);
 If cdsItem.IsEmpty Then
     Begin
        MsgDlg('Não há requisição para ser atendida','Erro',mtError,[mbOk],0);
     End
 Else
 If (rSaldo <=0) then
     Begin
         MsgDlg('Atendimento não pode ser realizado, saldo igual a zero', 'Erro', mtError, [mbOk, mbHelp], 0);
     End
 Else
    Begin
       edNome.Clear;
       edDepto.Clear;
       If edDataAtend.Text = '' Then
          edDataAtend.Date := Date;
       //
       With TCMClientDataSet.Create(nil) Do
          Try
            Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,cdsItem.FieldByName('CODCENTROCUSTO').AsString);
            edDepto.Text := FieldByName('NOME').AsString;
          Finally;
             Free;
          End;
       //
       edLocalizacao.Text:= Artigo.GetLocalizacao(Modulo.iCodAlmoxa ,cdsItem.FieldByName('CODARTIGO').asString);

       reSaldo.Value := rSaldo;

       if (reSaldo.Value < EdQtdeSolic.Value) then
          EdQtdeAtend.Value := reSaldo.Value
       else
          EdQtdeAtend.Value := EdQtdeSolic.Value;


       cdsSubGrid.Data   := ReqMat.ListOutrasRequisicoes(Sistema.IdEmpresa,
                                                         cdsItem.FieldByName('CODARTIGO').AsString,
                                                         Modulo.iCodAlmoxa);

       EdSalComp.Value := 0;

       cdsSubGrid.First;
       While Not cdsSubGrid.Eof Do
          Begin
             EdSalComp.Value := EdSalComp.Value + UnMedida.QtdeToUnCustoMedio(cdsSubGrid.FieldByName('CODARTIGO').AsString,
                                                                              cdsSubGrid.FieldByName('CODMEDIDA').AsString,
                                                                              cdsSubGrid.FieldByName('QTDEPENDENTE').AsFloat);

             cdsSubGrid.Next;
          End;
       cdsSubGrid.First;

       pnlDet.BringToFront;

       EdQtdeAtend.SetFocus;
    End;
end;

procedure TFrmMTAtendReqCad.btCancelaClick(Sender: TObject);
begin
  inherited;
  GrdReq.BringToFront;
  btAtender.Enabled := True;
end;

procedure TFrmMTAtendReqCad.BtLimpaClick(Sender: TObject);
begin
  inherited;
  EdNumReq.text   := '';
  dblcCCust.text  := '';
  edDataReq.text  := '';
  edDataNec.text  := '';
end;

procedure TFrmMTAtendReqCad.BtOkClick(Sender: TObject);
Var
   bResto  : Boolean;
begin
 inherited;
 reSaldo.Value := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                       cdsItem.FieldByName('CODARTIGO').AsString,
                                       Modulo.icodAlmoxa,
                                       edDataAtend.Date);
 If edQtdeAtend.Value = 0 Then
    Begin
        MsgDlg('Atendimento não pode ser realizado, quantida igual a zero', 'Erro', mtError, [mbOk, mbHelp], 0);
        edQtdeAtend.SetFocus;
    End
 Else
    If UnMedida.QtdeToUnCustoMedio(cdsItem.FieldByName('CODARTIGO').AsString,
                                   cdsItem.FieldByName('CODMEDIDA').AsString,
                                   edQtdeAtend.Value) > reSaldo.Value Then
    Begin
        MsgDlg('Atendimento não pode ser realizado, quantida maior que a em estoque nesta data', 'Erro', mtError, [mbOk, mbHelp], 0);
        edQtdeAtend.SetFocus;
    End
  Else
    Begin
       bResto := True;
       If Format('%15.5f',[EdQtdeAtend.Value]) < Format('%15.5f',[edQtdeSolic.Value]) Then
          Begin
             bResto :=  MsgDlg('A quantidade atendida é menor que a solicitada. Deseja deixar o restante pendente',
                        'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes;
          End;
       If Not ReqMat.AtenderReqCad(Sistema.IdEmpresa ,EdQtdeAtend.Value,
                                   edDataAtend.Date,Sistema.IdUsuario,bResto)
       Then
          MsgDlg(ReqMat.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);

       Sel;

       GrdReq.BringToFront;
       btAtender.Enabled := True;
    End;
end;

procedure TFrmMTAtendReqCad.BtAtenderClick(Sender: TObject);
begin
  inherited;
  pnlSelect.Enabled := False;
  Try
    Atender;
  Finally
    pnlSelect.Enabled := True;
  End;
end;

procedure TFrmMTAtendReqCad.Sel;
begin
   cdsItem.Data := ReqMat.ListItemAntendimento(Sistema.IdEmpresa,
                                               Modulo.iCodAlmoxa,
                                               dblcCCust.LookupValue,
                                               StrToIntDef(EdNumReq.Text,0),
                                               edDataReq.Date,EdDataNec.Date);
end;

procedure TFrmMTAtendReqCad.BtnEstornarClick(Sender: TObject);
begin
  inherited;
  If cdsItem.IsEmpty Then
     Begin
        MsgDlg('Não há requisição para ser atendida','Erro',mtError,[mbOk],0);
     End
  Else
     If MsgDlg('Confirma o Estorno','Confirmação',mtConfirmation,[mbOk,mbCancel],0)= MrOK Then
        Begin
           If Not ReqMat.EstornarReqCad Then
              MsgDlg(ReqMat.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);

           btnSelecionar.Click;   
        End;

end;

procedure TFrmMTAtendReqCad.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  Sel;
end;

procedure TFrmMTAtendReqCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlParamGlobal );
  ReqMat.Free;
  Almox.Free;
  Artigo.Free;
  CentroCusto.Free;
  MovEstoque.Free;
  UnMedida.Free;
  inherited;
end;

procedure TFrmMTAtendReqCad.edDataAtendExit(Sender: TObject);
begin
  inherited;
 If edDataAtend.Date > Date Then
    Begin
        MsgDlg('Data da Atendimento não pode ser maior que a data de hoje','Erro',mtError,[mbOk],0);
        edDataAtend.SetFocus;
    End
  Else
    Begin
      reSaldo.Value := MovEstoque.InfoSaldo(Sistema.IdEmpresa,
                                            cdsItem.FieldByName('CODARTIGO').AsString,
                                            Modulo.icodAlmoxa,
                                            edDataAtend.Date);
    End;
end;

procedure TFrmMTAtendReqCad.EdQtdeAtendExit(Sender: TObject);
begin
  inherited;
  If EdQtdeAtend.Value >  reSaldo.Value  Then
     Begin
        MsgDlg('Quantidade maior que a quantidade em estoque', 'Erro', mtError, [mbOk, mbHelp], 0);
        EdQtdeAtend.SetFocus;
     End;
   If EdQtdeAtend.Value > ( EdQtdeSolic.Value +(  EdQtdeSolic.Value * Modulo.iPercReqMat )/100 ) Then
     Begin
         MsgDlg('Quantidade maior que a quantidade solicitada', 'Erro', mtError, [mbOk, mbHelp], 0);
         EdQtdeAtend.SetFocus;
     End;
end;

end.
