unit uCtrlCAF;

interface

uses uCmControlObject, SysUtils, extCtrls, uCMTypes,
     uCtrlMovBaixa, uCtrlBem;

Type TCtrlCAF = class(TCmControlObject)
     private
        CtrlBem     : TCtrlBem;
        CtrlMovBaixa: TCtrlMovBaixa;

        FbTransacao: Boolean;
        procedure SetbTransacao(const Value: Boolean);

     protected
        procedure AfterInitialize;  Override;

     public
        constructor Create;  override;
        destructor  Destroy; override;

        property bTransacao: Boolean read FbTransacao write SetbTransacao;

        function ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem : Extended;
                              iMotivoBaixa : Integer;
                              dDataBaixa : TDateTime;
                              iTipoPropBaixa : Integer;
                              nPropBaixar, nValVenda : Extended;
                              sObsBaixa, sPlaContaDestino : String;
                              iTipDepProRata : Integer) : Boolean;

        function SaldoContabil(iEmpresaProp, iBem : Integer; dDataSld : tDateTime;
                               iMoeCodigo, iTaxaDep : Integer) : Extended;


     published

end;


implementation

{ TCtrlCAF }


constructor TCtrlCAF.Create;
begin
   inherited;
   // Cria os CtrlObjects
   CtrlMovBaixa := TCtrlMovBaixa.Create;
   CtrlBem      := TCtrlBem.Create;

end;

destructor TCtrlCAF.Destroy;
begin
   // Destrói os CtrlObjects criados
   FreeAndNil( CtrlMovBaixa );
   FreeAndNil( CtrlBem );
   inherited;
end;

procedure TCtrlCAF.AfterInitialize;
begin
   inherited;
   // Inicializa os demais ctrls
   CtrlMovBaixa.InitializeAs( Self );
   CtrlBem.InitializeAs( Self );
end;

procedure TCtrlCAF.SetbTransacao(const Value: Boolean);
begin
  FbTransacao := Value;
end;

function TCtrlCAF.ExecutaBaixa(nModulo, nEmpresaProp, nUsuario,
  nBem: Extended; iMotivoBaixa: Integer; dDataBaixa: TDateTime;
  iTipoPropBaixa: Integer; nPropBaixar, nValVenda: Extended; sObsBaixa,
  sPlaContaDestino: String; iTipDepProRata: Integer): Boolean;
var bTransAnt : Boolean;
begin
   // Desabilita a transação
   bTransAnt := Self.OpenTransaction;
   Self.OpenTransaction := FbTransacao;
   CtrlMovBaixa.OpenTransaction := FbTransacao;

   Result := CtrlMovBaixa.ExecutaBaixa(nModulo, nEmpresaProp, nUsuario, nBem,
                                       iMotivoBaixa, dDataBaixa, iTipoPropBaixa,
                                       nPropBaixar, nValVenda, sObsBaixa,
                                       sPlaContaDestino, iTipDepProRata);
   MessageInfo := CtrlMovBaixa.MessageInfo;

   // Retorna o Status da transação
   Self.OpenTransaction := bTransAnt;
end;


function TCtrlCAF.SaldoContabil(iEmpresaProp, iBem: Integer;
  dDataSld: tDateTime; iMoeCodigo, iTaxaDep: Integer): Extended;
begin
  Result := CtrlBem.SaldoContabil(iEmpresaProp, iBem, dDataSld,
                                  iMoeCodigo, iTaxaDep);
end;

end.
