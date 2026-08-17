unit FImpSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, TREdit,
  CmEventosCadastro, ImgList, wwdblook;

type
  TFrmImpSaldo = class(TFrmCadastroGridCS)
    Grp: TGroupBox;
    GrpArt: TGroupBox;
    Label1: TLabel;
    dbCodArt: TDBEdit;
    Label2: TLabel;
    edDesc: TDBEdit;
    edSaldo: TDBRealEdit;
    edCustoMed: TDBRealEdit;
    edUN: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edValUltCompra: TDBRealEdit;
    qryCODARTIGO: TStringField;
    qryVALULTCOMPRA: TFloatField;
    qryDESCPROD: TStringField;
    qrySALDOQTDEMOV: TFloatField;
    qryCUSTOMEDIOMOV: TFloatField;
    qryCODMEDCUSTO: TStringField;
    qryUnidNegoc: TwwQuery;
    Label8: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   Function ZeraSaldo( icodAlmox : LongInt; sCodArt : String; var bTemMov:Boolean ) : Boolean;
   Procedure Sel( sGrupo : String );
  public
    { Public declarations }
  end;

var
  FrmImpSaldo  : TFrmImpSaldo;

implementation

{$R *.DFM}
Uses uSistema, uModulo, uMensErro, udataBase, dBaseDados,
     UFuncaoGeral,uMovNew,uString;

Function TFrmImpSaldo.ZeraSaldo( icodAlmox : LongInt; sCodArt : String; var bTemMov:Boolean ) : Boolean;
Var
    iIdMov        : LongInt;  // índice da tabela movimente
    rSaldo        : Double;   // Saldo do almoxarifado
    rSaldoUC      : Double;   // Saldo da unidade de custeio
    cAuxSeparador : Char;     // Seprador de casas decimais da Query
Begin
// Verifica se já houve implantação
    Result   := True;
    bTemMov  := False;
Try
    If FazQuery(DtmBaseDados.qry,'SELECT IDMOV, QTDEMOV FROM MOVIMENT '+
                                 ' WHERE '+
                                 '       (CODARTIGO = '''+Espaco(Trim( sCodArt ),14)+''')'+
                                 '   AND (CODTIPOMOV = ''Z'') '+
                                 '   AND (CODALMOXARIFADO = '+IntToStr( icodAlmox )+')')
    Then
       Begin
          iIdMov := DtmBaseDados.qry.FieldByName('IDMOV').AsInteger;
          rSaldo := DtmBaseDados.qry.FieldByName('QTDEMOV').AsFloat;

          If FazQuery(DtmBaseDados.qry,'SELECT SALDOQTDEUC FROM CUSTOMED'+
                                       ' WHERE (CODARTIGO  = '''+Espaco(Trim(sCodArt),14)+''')'+
                                       '   AND (CODCUSTEIO = '+IntToStr(Modulo.LeUnCusteio( icodAlmox ))+')')
          Then
             Begin
                 rSaldoUC := DtmBaseDados.qry.FieldbyName('SALDOQTDEUC').asFloat;
                  // Já tendo o ocorrido movimentação de implantação de Saldo, este diminue o saldo do almoxarifado
                 // da unidade de custeio. Para este ser reimplantado.
                  rSaldoUC := rSaldoUC - rSaldo;
                  cAuxSeparador    := DecimalSeparator;
                  DecimalSeparator := '.';
                  If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE CUSTOMED SET SALDOQTDEUC = '+FormatFloat('#0.00000',rSaldoUC)+' WHERE (CODARTIGO = '''+Espaco(Trim(sCodArt),14)+''') AND (CODCUSTEIO = '+IntToStr( Modulo.LeUnCusteio(icodAlmox) )+')') Then
                    Abort;
                  If Not ExecutarQuery(DtmBaseDados.qry,'UPDATE SALDO SET SALDOQTDE = SALDOQTDE - '+FormatFloat('#0.00000',rSaldo)+' WHERE (CODARTIGO = '''+Espaco(Trim(sCodArt),14)+''') AND (CODALMOXARIFADO = '+IntToStr( icodAlmox )+')') Then
                    Abort;
                  DecimalSeparator := cAuxSeparador;
             End;
         If Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM MOVIMENT WHERE (IDMOV = '+IntToStr( iIdMov )+')') Then
           Abort;
         If FazQuery(DtmBaseDados.qry,'SELECT IDMOV, QTDEMOV FROM MOVIMENT '+
                                      ' WHERE '+
                                      '       (CODARTIGO = '''+Espaco(Trim( sCodArt ),14)+''')'+
                                      '   AND (CODTIPOMOV <> ''Z'') ') Then bTemMov := True;

       End;
 Except
      Result := False;
 End;
End;

procedure TFrmImpSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.Open;
  Grp.Caption := Format(' Almoxarifado - %s ',[Modulo.sAlmoxaUsuario]);
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;
end;

Procedure TFrmImpSaldo.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    edSaldo.SetFocus;
End;

Procedure TFrmImpSaldo.CmeCadastroFind(Sender: TObject);
Begin
    inherited;
     if MontaSelect.RetornouValor Then
        Begin
            Sel(MontaSelect.ValoresChave[0]);
        End;
End;
Procedure TFrmImpSaldo.Sel( sGrupo : String );
Begin
    qry.Close;
    qry.ParamByName('pCODALMOXARIFADO').asInteger := Modulo.iCodAlmoxa;
    qry.ParamByName('pCODGRUPOPROD').asString     := Espaco(Trim(sGrupo),10);
    qry.Open;
End;

Procedure TFrmImpSaldo.CmeCadastroConfirma(Sender: TObject);
Var
   iMov : Integer;
   bTemMovItem : Boolean;
Begin
    if qry.State in [dsInsert,dsEdit] Then
       Begin
           qryCUSTOMEDIOMOV.asFloat := edCustoMed.Value;
           qrySALDOQTDEMOV.asFloat  := edSaldo.Value;
           Try
               StartTransacao;
               If (trim(dblcAtiv.Text) = '') Then
                  Begin
                     MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
                     dblcAtiv.SetFocus;
                     Abort;
                  End;
               if Not ZeraSaldo(Modulo.iCodAlmoxa,qry.FieldByName('CODARTIGO').asString,bTemMovItem) Then
                  Abort;
               if bTemMovItem then begin
                  if MsgDlg('Este item já tem movimentação. '+
                            'Confirma a Alteração assim mesmo?','Confirmação',mtConfirmation,[mbNo,mbYes],0)  = mrNo then Abort;
               end;
               iMov := MovNew.GeraMov('E',
                                      (edSaldo.Value * edCustoMed.Value),
                                      (edSaldo.Value),
                                      Modulo.iCodCusteio,
                                      Modulo.iCodAlmoxa,
                                      qry.FieldByName('CODARTIGO').AsString,
                                      '',
                                      'Z',
                                      qry.FieldByName('CODMEDCUSTO').AsString,
                                      DateToStr(Modulo.LeDataImplantacao),
                                      DateToStr(Modulo.LeDataImplantacao),
                                      '',
                                      Modulo.sCodCCusto,
                                      Sistema.IdEmpresa,
                                      -1,
                                       strToInt(dblcAtiv.LookUpValue) );
               if iMov = -1 then
                    Abort;
               If Not ExecutarQuery(DtmBaseDados.qry,' UPDATE ARTIGO SET VALULTCOMPRA = '+ FuncaoGeral.OraNumero(edValUltCompra.Value)+
                                                     ' WHERE (CODARTIGO = '''+Espaco(Trim(qry.FieldByName('CODARTIGO').AsString),14)+''')') Then
                  Abort;
               //
               If bTemMovItem Then
                  Begin
                     MovNew.AtualizaSaldo(Modulo.LeDataImplantacao-1 ,qry.FieldByName('CODARTIGO').AsString,Modulo.iCodAlmoxa);
                     MovNew.GeraRetroativo(Modulo.LeDataImplantacao-1,qry.FieldByName('CODARTIGO').AsString);
                  End;
               CommitTransacao;
           Except
               RollbackTransacao;
               MsgDlg('Erro na gravação dos dados','Erro',mtError,[mbOK],0);
               Raise;
           End;
         qry.Post;
         If Not qry.EOF Then
             qry.Next;
      End;
end;

Procedure TFrmImpSaldo.CmeCadastroCancel(Sender: TObject);
Begin
    inherited;
    qry.Cancel;
    qry.Close;
    qry.Open;
    dbGrd.BringToFront;
End;

procedure TFrmImpSaldo.bbtnSairClick(Sender: TObject);
begin
  qry.CancelUpdates;
  inherited;

end;

procedure TFrmImpSaldo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Click;
end;

procedure TFrmImpSaldo.FormShow(Sender: TObject);
begin
  inherited;
  dbGrd.BringToFront;
end;

end.
